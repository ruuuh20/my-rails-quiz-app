class CoursesController < ActionController::Base

  def new
    @course = Course.new
  end

  def index
    @user = current_user
    @courses = Course.all
  end

  def create
    @course = current_user.courses.build(course_params)
    # @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Course Added"
      redirect_to course_path(@course)
    else
      flash[:error] = "errorrrrr"
      render 'courses/new'
    end
  end

  def show
    @course = Course.find(params[:id])
  end


  private
    def course_params
      params.require(:course).permit(:name)
    end


end
