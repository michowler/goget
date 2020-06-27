class HomepageController < ApplicationController

	def index
	end

	def my_jobs
		@user = current_user
		@job_list = @user.jobs.except(@user.id)
  		# @user = User.find(params[:id])
  	end

  	def all_jobs_list
  		@job_list = Job.all  		
  		# @user = current_user
		# @job_list = Job.all_except(@user.id)		
  		# @user = User.find(params[:id])
  	end

end
