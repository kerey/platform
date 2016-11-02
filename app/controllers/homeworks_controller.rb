class HomeworksController < ApplicationController
  	before_action :logged_in_user, only: [:create, :destroy, :new]
  	before_action :find_homework, only: [:show, :destroy, :edit, :update]
  	# before_action :registrated, only: [:]
	##FOR ALL
  	def index
		@homeworks = current_course.homeworks
	end
	##ONLY FOR REGISTRATED STUDENTS######
	def show
		add_current_homework(@homework.id)
		# if current_user.student && !current_user.answered(@homework)
			@answer = Answer.new
		# end
		if current_user.owner?(current_course)
			@answers = current_homework.answers
		end
		
	end
	##ONLY FOR TEACHERS##############
  	def new
    	@homework = Homework.new  	
  	end
	def create 
		@homework = current_course.homeworks.build(homework_params)
	    if @homework.save
	      	flash[:success] = "Домащнее задание создан!"
	      	redirect_to current_course
	    else
	      	flash[:error] = "Домащнее задание не создан!"
	 		render :new
	    end
	end
	def edit
	end
	def update
	    if @homework.update(lesson_params)
   	    	redirect_to @homework, notice: 'Домащнее задание обнавлено'
	    else
	    	render :edit 
	    end
	end
	def destroy
    	@homework.destroy
    	flash[:success] = "Домащнее задание было удалено!"
    	redirect_to current_course
    end
	##################################
	private
		def find_homework
  			@homework = Homework.find(params[:id])
		end
		def homework_params
		  params.require(:homework).permit(:title, :short_description,:points)
		end
		
end