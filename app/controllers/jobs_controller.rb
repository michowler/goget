class JobsController < ApplicationController
  before_action :jobs, only: [:update]
  def create
    job = Job.new(job_params)
    if job.save
      redirect_to '/'
    else
      flash[:danger] = job.errors.full_messages 
      redirect_to '/'
    end
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
