require 'pry'
class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :must_be_admin, only: [:create, :delete]

  def new
    # @course = current_user.courses.build
    @course = Course.find(params[:course_id])
    @quiz = @course.quizzes.build(id: params[:id], title: params[:title], description: params[:description], course_id: params[:course_id])

  end

  def create
    # @course = Course.find_by_id(params[:course_id])
    @quiz = Quiz.new(quiz_params)
    # current_user.quizzes.build
    @course = Course.find(params[:course_id])
    if @quiz.save
      flash[:success] = "Quiz was successfully created."
      redirect_to course_quiz_path(@quiz.course_id, @quiz.id)
    else
      flash[:error] = "Error"
      render 'quizzes/new'
    end

  end

  def index
    @courses = Course.all
      # filter the @quizzes list based on user input
      if !params[:course_id].blank?
        @quizzes = Quiz.by_course(params[:course_id])
      else
        @quizzes = Quiz.all
      end
    @course = Course.find(params[:course_id])
    @course_quizzes = @course.quizzes.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def edit
    @quiz = Quiz.find(params[:id])
    @course = Course.find(params[:course_id])
  end


  def update
    @quiz = Quiz.find(params[:id])
    @course = Course.find(params[:course_id])
    # binding.pry
    #admin updates the quiz
    if current_user.is_admin?
      @quiz.update(quiz_params)
      @quiz.save
    else
      #non-admin changes status
      @quiz.status = "Submitted"
      # @quiz.update(:status => params[:status])
      @quiz.save
      # binding.pry

    end
    redirect_to course_quizzes_path(@course)
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    flash[:success] = "Deleted"
    redirect_to root_path
  end

  private
    def quiz_params
      params.require(:quiz).permit(:course_name, :title, :description, :course_id)
    end


end
