module ApplicationHelper
  def user_logged_in?
    session[:user_id].nil? ? false : true
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def display_errors_partial(model)
    render '/events/errors', model: model  if model.errors.any?
  end

  def user_navbar
    if user_logged_in?
      render '/layouts/nav/logged_user_nav'
    else
      render '/layouts/nav/unlogged_user_nav'
    end
  end

end
