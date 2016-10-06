class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :check_teacher, only: [:create, :new] 
##FOR ALL#############################  
  def index
    @courses = Course.all
  end
  def show
    @course = Course.find(params[:id])
    @lessons = @course.lessons.paginate(page: params[:page])
  end
  def my_courses
    @my_courses = Course.where(teacher_id: current_user.id) 
  end
##ONLY FOR TEACHERS####################
  def new
    @course = Course.new
  end
  def create
    @course = Course.new(course_params)
    @course.teacher_id = current_user.id
    @course.teacher = current_user
    if @course.save
      # format.html { redirect_to @course, notice: 'Course was successfully created.' }
      # format.json { render :show, status: :created, location: @course }
      redirect_to @course        
    else
      format.html { render :new }
      format.json { render json: @course.errors, status: :unprocessable_entity }
    end
  end
  def edit
  end
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
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
    @course = Course.find(params[:id])
  end
  def register_student
    @
  end
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
