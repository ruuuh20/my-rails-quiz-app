class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show

    @user = current_user
    @courses = @user.courses
    @user_quizzes = 0

    #for admin
    @total_courses_count = Course.all.count
    @total_quiz_count = Quiz.all.count
    @total_users_count =  User.all.count
    # binding.pry

    #for students
    if current_user.courses.count == 0
        @quiz_count = 0
    else
      @quiz_count = 0
      current_user.courses.each do |c|
        @quiz_count += c.quizzes.count
        @quiz_count

      end
    end
    @q = Quiz.all
    @all_quizzes = @q.map { |quiz| quiz.title }
      current_user.courses.each do |r|
        @my_submitted_quiz = r.quizzes.select { |qz| qz.submitted }
      end


  # binding.pry
    # @submitted_quizzes = Quiz.submitted
    @in_progress_quizzes = Quiz.in_progress
    @not_submitted_quizzes = Quiz.not_submitted

    # binding.pry
    # current_user.courses.each do |c|

    #submitted
    # @quizzes.each do |q|
    #   if q.submitted?
    #     arrayyy
    # binding.pry
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #successful update
      flash[:success] = "Profile updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end


  private
    def user_params
      params.require(:user).permit(course_ids: [])
    end

end
