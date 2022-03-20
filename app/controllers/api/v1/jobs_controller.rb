class Api::V1::JobsController < ApplicationController
    before_action :authorized
    before_action :logged_in_user
    def index
        @jobs = Job.is_active
        render json: @jobs
    end
    
end
