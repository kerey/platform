class RelationshipsController < ApplicationController
	before_action :logged_in_user
	def create
		student = User.find(params[:student_id])
		course = Course.find(params[:course_id])
		course.register(student)		
	end
	def destroy
		student = User.find(params[:student_id])
		course = Course.find(params[:course_id])
		course.unregister(student)
	end

end
