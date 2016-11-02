module MySessionsHelper
	def current_course
		Course.find(session[:current_course_id])
	end
	def add_current_lesson(lesson_id)
		session[:current_lesson_id] = lesson_id
	end
	def current_lesson
		Lesson.find(session[:current_lesson_id])
	end
	###FOR CURRENT HOMEWORK
	def add_current_homework(homework_id)
		session[:current_homework_id] = homework_id
	end
	def current_homework
		@current_homework ||= Homework.find(session[:current_homework_id])
	end 
end
