class AnswersController < ApplicationController
	before_action :set_answer, only: [:show, :update, :edit]
	def new 
		@answer = Answer.new
	end
	def create
		@answer = current_homework.answers.build(answer_params)
		@answer.student_id = current_user.id
		@answer.homework_id = current_homework.id
		if @answer.save
	      	flash[:success] = "Ответ принят!"
		else
	      	flash[:success] = "Ответ не принят!"

		end
		redirect_to current_homework
	end
	def show
	end
	def update
		if @answer.update(answer_params)
		  redirect_to @answer, notice: 'Успешно!'
		else
		  redirect_to @answer, notice: 'Не успешно!'
		end
  	end
  	def edit 
  	end
	private 
		def answer_params
      	  params.require(:answer).permit(:content, :answer_file, :points, :comment)
        end
        def set_answer
			@answer = Answer.find(params[:id])		
        end
	def open_file
	end
end