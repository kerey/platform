class AnswersController < ApplicationController
	before_action :authenticate_user!
	def new 
	end
	def create
		@answer = current_lesson.answers.build(answer_params)
		@answer.student_id = current_user.id
		@answer.lesson_id = current_lesson.id
		if @answer.save
	      	flash[:success] = "Ответ принят!"
		else
	      	flash[:success] = "Ответ не принят!"
		end
		redirect_to current_lesson
	end
	def show
		@answer = Answer.find(params[:id])		
	end
	private 
		def answer_params
      	  params.require(:answer).permit(:content, :answer_file)
        end
	
end
