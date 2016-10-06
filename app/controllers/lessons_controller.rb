class LessonsController < ApplicationController
  	before_action :logged_in_user, only: [:create, :destroy, :new]
  	def show
  		@lesson = Lesson.find(params[:id])
  	end
  	def new
  		@course = Course.find(params[:id])
    	@lesson = @course.lessons.build if logged_in?   	
  	end
	def create 
		@course = Course.find(params[:lesson][:course_id])
		@lesson = @course.lessons.build(lesson_params)
	    if @lesson.save
	      	flash[:success] = "Lesson created!"
	      	redirect_to controller: 'courses', action: 'show', id: @course.id
	    else
	    	redirect_to 'static_pages/home'
	    end
	end
	def destroy
	end
	def index
		@course = Course.find(params[:id])
		@lessons = @course.lessons
	end

	private

    def lesson_params
      params.require(:lesson).permit(:title, :short_description)
    end
end
