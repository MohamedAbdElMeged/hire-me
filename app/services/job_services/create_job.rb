module JobServices
    class CreateJob
        def initialize(job_params,user_id)
            @job_params = job_params
            @user_id = user_id
        end
        def call
            create_job
            @job
        end
        private
        def create_job
            @job = Job.new(
               title: @job_params[:title],
               company_id: @job_params[:company_id], 
               location_id: @job_params[:location_id], 
               country_id: @job_params[:country_id], 
               level: @job_params[:level], 
               job_type: @job_params[:job_type], 
               years_of_exp: @job_params[:years_of_exp], 
               recruiter_id: @user_id, 
               is_active: @job_params[:is_active]
            )
            puts @job_params.inspect + " vbffbb"
            @job_params[:skills].each do |skill|
                Skill.find_or_create_by(name: skill)
            end
            @job.save!
        end
        
    end
end