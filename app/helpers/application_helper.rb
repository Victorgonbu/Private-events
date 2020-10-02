module ApplicationHelper
  def user_logged_in?
    session[:user_id].nil? ? false : true
  end
end
