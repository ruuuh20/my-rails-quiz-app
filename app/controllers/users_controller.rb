class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
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
