module ProfileServices
    class EditProfile
        def initialize(profile_params,user_id)
            @profile_params = profile_params
            @user_id = user_id
        end
        def call
            edit_profile
            @profile
        end
        private
        def edit_profile
            @profile = ProfileServices::GetProfile.new(@user_id).call
            @profile.update(@profile_params)
        end
        
        
        
    end
    
end