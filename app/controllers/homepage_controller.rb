class HomepageController < ApplicationController

	def index
	end

  	def all_jobs_list  		  		  	
  		@user = current_user		
		@job_list = Job.where.not(user_id: @user.id)  					
  	end

end
