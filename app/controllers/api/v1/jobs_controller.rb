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
        @user = User.find(params[:id])
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
              format.json { render :show, status: :ok, location: api_v1_todo_item_path(@todo_item) }
            else
              format.json { render json: @todo_item.errors, status: :unprocessable_entity }
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
  