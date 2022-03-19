class Api::V1::ProfilesController < ApplicationController
    before_action :authorized
    before_action :logged_in_user

    def create_profile
        profile = @user.profile.build(profile_params)
    end
    private
    def profile_params
        params.require(:profile).permit(:cv,:current_job,:description,:github_link,:linkedin_link,:company_name)
    end
    
end
