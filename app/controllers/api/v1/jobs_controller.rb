class Api::V1::JobsController < ApplicationController
    before_action :authorized,except: [:index]
    before_action :logged_in_user,except: [:index]
    before_action :set_job, except: [:create,:index]
    def index
        @jobs = Job.includes(:skills).is_active
        render json: @jobs
    end
    def create
        @job = JobServices::CreateJob.new(job_params,@user.id).call
        render json: @job
    end
    def update
        
    end
    def show
        render json: @job
    end
    def destroy
        @job.destroy
        head(:no_content)
        
    end
    def toggle_active
        @job.is_active = !@job.is_active
        @job.save!
        render json: @job
    end
    
    private
    def job_params
        params.require(:job).permit(:title,:company,:job_type,:location,:country,:level,:type,:years_of_exp,:is_active,:skills=>[])
    end
    def set_job
        @job = Job.find(params[:id])
    end
    
    
end
