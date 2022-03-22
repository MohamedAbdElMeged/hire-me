class Api::V1::UsersController < ApplicationController
    before_action :authorized, only: [:profile, :logout]
    before_action :logged_in_user, only: [:profile,:logout]
    def register
        user = User.new(user_params)
        if user.save!
            user.auth_token = create_token(user.get_default_data,900)
            render json: {token: user.auth_token}
        else
            render json: user.errors
        end
    end
    def login
        user = User.find_by(email: params[:email])
        if user.valid_password?(params[:password])
            user.auth_token = create_token(user.get_default_data,900)
            render json: {token: user.auth_token}
        else
            render json: {message: "Invalid Credentials"},status: 401
        end
        
    end

    def profile
        render json: @user.get_default_data
    end
    def logout
        $redis.sadd("blacklist",@user.auth_token)
        head(:unauthorized)
    end
    
    
    
    private
    def user_params
        params.permit(:first_name,:last_name,:email,:password,:password_confirmation,:profile_picture)
    end
end
