class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :check_teacher, only: [:create, :new, :my_courses] 
##FOR ALL#############################  
  def index
    @courses = Course.all
  end
  def show
    @lessons = @course.lessons.paginate(page: params[:page])
    @students = @course.students
    add_current_course(@course.id)
  end
##ONLY FOR TEACHERS####################
  def my_courses
    @my_courses = Course.where(teacher_id: current_user.id) 
  end
  def new
    @course = Course.new
  end
  def create
    @course = Course.new(course_params)
    @course.teacher_id = current_user.id
    @course.teacher = current_user
    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new 
    end
  end
  def edit
  end
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
##ONLY FOR ADMINS#####################
  def add_students
    @students = User.where(student: true)
    @course = Course.find(params[:course_id])
  end
  def register_student
    @course = Course.find(params[:course_id])
    @student = User.find(params[:student_id])
    @course.register(@student)
    
    flash[:success] = ("You successfully add #{@student.name} to #{@course.title} course");
    redirect_to action: "add_students", course_id: @course.id
  end
  def unregister_student
    @course = Course.find(params[:course_id])
    @student = User.find(params[:student_id])
    @course.unregister(@student)
    flash[:success] = ("You successfully drop #{@student.name} from #{@course.title} course");
    redirect_to action: "add_students", course_id: @course.id

  end 
######################################
  private
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :short_description)
    end

    def check_teacher
      if !current_user.teacher?
        redirect_to root_url
      end
    end
    def check_owner
      redirect_to(root_url) unless current_user?(@course.teacher) 
    end

end
