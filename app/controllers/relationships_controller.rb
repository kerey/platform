class RelationshipsController < ApplicationController
	before_action :authenticate_user!
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
