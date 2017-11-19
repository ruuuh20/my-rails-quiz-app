require 'pry'
class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :must_be_admin, only: [:create, :edit, :delete, :update]

  def new
    @course = Course.new
  end

  def index
    @user = current_user
    @courses = Course.all
    @my_courses = @user.courses
    # binding.pry
  end

  def create
    @course = current_user.courses.build(course_params)
    # @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course Added"
      redirect_to course_path(@course)
    else
      flash[:error] = "Error"
      render 'courses/new'
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:success] = "Deleted"
    redirect_to root_path
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    if @course.save
      flash[:success] = "Successfully updated"
      redirect_to course_path(@course)
    else
      flash[:error] = "There was an error"
      redirect_to courses_path
    end
  end



  private
    def course_params
      params.require(:course).permit(:name)
    end


end
