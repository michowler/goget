class Api::V1::JobsController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :create, :update]
    before_action :set_job, only: [:show, :edit, :create, :update]
    
    def index
      @jobs = Job.all
    end

    def edit
      @jobs = Job.all
    end

    def create
      @job = current_user.jobs.build(job_params)
      if authorized?
        respond_to do |format|
          if @todo_item.save
            format.json { render :show, status: :created, location: api_v1_todo_item_path(@todo_item) }
          else
            format.json { render json: @todo_item.errors, status: :unprocessable_entity }
          end
        end
      else
        handle_unauthorized
      end
    end

    def show
        if authorized?
            respond_to do |format|
              format.json { render :show }
            end
        else
            handle_unauthorized
        end
    end
    

    def update
        if authorized?
          respond_to do |format|
            if @job.update(job_params)
              format.json { render :show, status: :ok, location: api_v1_job_path(@job) }
            else
              format.json { render json: @job.errors, status: :unprocessable_entity }
            end
          end
      else
          handle_unauthorized
      end
    end
   
    private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
        params.require(:job).permit(:user_id, :book_status, :pickup_address, :dropoff_address, :pickup_lat, :pickup_long, :dropoff_lat, :dropoff_long)
    end

    def authorized?
      @job.user == current_user
    end

    def handle_unauthorized
        unless authorized?
          respond_to do |format|
            format.json { render :unauthorized, status: 401 }
          end
        end
    end
end
  