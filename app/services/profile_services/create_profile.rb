module ProfileServices
    class CreateProfile
        def initialize(profile_params,user_id)
            @cv = profile_params[:cv]
            @current_job = profile_params[:current_job]
            @description = profile_params[:description]
            @linkedin_link = profile_params[:linkedin_link]
            @github_link = profile_params[:github_link]
            @company_name = profile_params[:company_name]
            @user_id = user_id
        end
        def call
            create_profile
            @profile
        end
        private
        def create_profile
            @profile = Profile.create!(
                cv: @cv,
                current_job: @current_job,
                description: @description,
                linkedin_link: @linkedin_link,
                github_link: @github_link,
                company_id: CompanyServices::CreateCompany.new(@company_name).call ,
                user_id: @user_id
            )
        end
        
    end
end