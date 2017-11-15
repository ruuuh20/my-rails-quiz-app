class QuizzesController < ActionController::Base

  def new

    # @course = current_user.courses.build


    @course = Course.find(params[:course_id])
    @quiz = Quiz.build(id: params[:id], title: params[:title], description: params[:description], course_id: params[:course_id])

  end

  def create
    # @course = Course.find_by_id(params[:course_id])
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to course_quiz_path(@quiz.course_id, @quiz.id)
    else
      flash[:error] = "errorororororo"
      render 'quizzes/new'
    end

  end

  def index

    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  private
    def quiz_params
      params.require(:quiz).permit(:title, :description, :course_id)
    end


end