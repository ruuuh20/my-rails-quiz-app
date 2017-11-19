class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || root_path
end

# def current_user
#   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
# end

private

  def must_be_admin
     unless current_user && current_user.is_admin?
       redirect_to root_path, notice: "You are not admin"
     end
   end



# In case you want to permit additional parameters (the lazy way™), you can do so using a simple before filter in your ApplicationController:
protected
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:email, :password, :password_confirmation, :course_id => [:course_id])
  end
end
end
