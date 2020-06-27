class JobsController < ApplicationController
  before_action :jobs, only: [:update]
    def index
      @user = current_user    
      @job_list = Job.where(user_id: @user.id)      
    end

  def update
    if authorized?
      @job = Job.find(params[:id])
      @job.update(job_params)
      redirect_to '/'
    else
      handle_unauthorized
    end
  end

  private
  def job_params
    params.require(:job).permit(:user_id, :pickup_address, :dropoff_address, :pickup_lat, :pickup_long, :dropoff_lat, :dropoff_long)
  end
end
