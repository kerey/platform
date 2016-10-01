class CoursesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :check_teacher, only: [:create, :new]
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @lessons = @course.lessons.paginate(page: params[:page])
  end

  # GET /courses/new
  def new
    @course = Course.new
    # @lesson = current_course.lessons.build if logged_in?
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.teacher = current_user
    if @course.save
      # format.html { redirect_to @course, notice: 'Course was successfully created.' }
      # format.json { render :show, status: :created, location: @course }
      render 'lessons/new'        
    else
      format.html { render :new }
      format.json { render json: @course.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
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

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def current_course
    @course
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :short_description, :teacher_id)
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
