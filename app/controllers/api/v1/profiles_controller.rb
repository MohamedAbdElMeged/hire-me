class Api::V1::ProfilesController < ApplicationController
    before_action :authorized
    before_action :logged_in_user

    def create_profile
        
        profile = ProfileServices::CreateProfile.new(profile_params,@user.id).call
        render json: profile
    end
    def edit_profile
        profile = ProfileServices::EditProfile.new(profile_params,@user.id).call
        render json: profile
    end
    
    private
    def profile_params
        params.permit(:cv,:current_job,:description,:github_link,:linkedin_link,:company_name)
    end
    
end
