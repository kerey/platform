class LessonsController < ApplicationController
  	before_action :logged_in_user, only: [:create, :destroy, :new]
  	before_action :find_lesson, only: [:show, :destroy, :edit, :update]
  	# before_action :registrated, only: [:]
##FOR ALL
  	def index
		@lessons = current_course.lessons
	end
##ONLY FOR REGISTRATED STUDENTS######
	def show
		add_current_lesson(@lesson.id)
	end
##ONLY FOR TEACHERS##############
  	def new
    	@lesson = Lesson.new  	
  	end
	def create 
		@lesson = current_course.lessons.build(lesson_params)
	    videos = params[:videos]
	    if !params[:videos].nil?
		    videos.each_with_index do |video, index|
		      	video = Video.new
				video = @lesson.videos.build(:lesson_id => @lesson.id, :url => videos[index])
		      	video.save
		      	# .create :lesson_id => @lesson.id, :url => videos[index]
	    	end
	   	end
	    if @lesson.save
	      	flash[:success] = "Урок создан!"
	      	redirect_to current_course
	    else
	      	flash[:error] = "Урок не создан!"
	 		render :new
	    end
	end
	def edit
	end
	def update
	    if @lesson.update(lesson_params)
   	    	redirect_to @lesson, notice: 'Course was successfully updated.'
	    else
	    	render :edit 
	    end
	end
	def destroy
    	@lesson.destroy
    	flash[:success] = "Урок был удален!"
    	redirect_to current_course
    end
##################################
	private
		def find_lesson
  			@lesson = Lesson.find(params[:id])
		end
		def lesson_params
		  params.require(:lesson).permit(:title, :short_description,:video_url,:homework, :videos)
		end
		
end