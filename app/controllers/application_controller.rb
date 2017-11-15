class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || root_path
end

def current_user
  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
end


end
