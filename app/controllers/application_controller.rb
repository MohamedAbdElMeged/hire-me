class ApplicationController < ActionController::API
  
    def encode_token(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end
    
    def create_token(user, expiration)
        exp = (Time.now+ expiration.hours).to_i
        return encode_token({user: user , exp: exp})
    end
    def get_token
        if auth_header 
          return auth_header.split(' ')[1]
        end
    end  
    def logged_in_user
        if decoded_token 
          user_email = decoded_token[0]['user']['email'].to_s
          #user_email = user_email.slice "EmailTokenJwT$^%#$151613EmailTokenJwT$"
            @user = User.find_by(email: user_email)  
            @user.auth_token = get_token    
        end
      end
      def decoded_token
        if auth_header &&
          token = auth_header.split(' ')[1]
          if !check_in_blacklist(token)
          # header: { 'Authorization': 'Bearer <token>' }
            begin
              JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
            rescue JWT::ExpiredSignature
              nil
            end
          end
        end
      end
      def check_in_blacklist(token)
        $redis.smembers("blacklist").include? token
      end
      
      
      def logged_in?
        !!logged_in_user  
      end
    
      def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless  logged_in?
      end
end
