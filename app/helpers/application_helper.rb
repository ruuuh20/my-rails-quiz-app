module ApplicationHelper
  # Returns true if the user is logged in, false otherwise.
 def logged_in?
   !current_user.nil?
 end
 
end
