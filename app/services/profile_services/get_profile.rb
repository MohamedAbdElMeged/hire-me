module ProfileServices
    class GetProfile
        def initialize(user_id)
            @user_id = user_id
        end
        def call
            get_profile
            @profile
        end
        private
        def get_profile
            @profile = Profile.find_by_user_id(@user_id) 
        end
        
        
        
    end
    
end