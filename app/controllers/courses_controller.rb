class CoursesController < ApplicationController
	def show 
		@courses = @user.microposts.paginate(page: params[:page])
	end
end
