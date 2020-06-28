class JobsController < ApplicationController  
  def index
    @user = current_user    
    @job_list = Job.where(user_id: @user.id)      
  end

  def new    
    @job = Job.new
  end

  def create    
    @user = current_user
    @job = @user.jobs.new(job_params)
    if @job.save
      redirect_to '/jobs', notice: "Job created."
    else
      redirect_to '/jobs', notice: "Sorry, job not saved."
    end 
  end

  def book    
    @job = Job.find(params[:id])
    @job.update_attribute(:book_status, true)
    flash[:notice] = "Job booked by #{current_user.name}."
    redirect_to '/'   
  end

  private
  def job_params
    params.require(:job).permit(:user_id, :pickup_address, :dropoff_address, :pickup_lat, :pickup_long, :dropoff_lat, :dropoff_long)
  end
end
