class Api::V1::JobsController < ApplicationController
    before_action :jobs, only: [:show, :edit, :update]
    def index
    end
    def show
    end
    def create
    end
    def update
    end
   
    private
    def set_jobs
        @jobs = Job.find(params[:id])
    end
end