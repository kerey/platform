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
end
