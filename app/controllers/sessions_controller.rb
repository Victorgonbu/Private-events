class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(log_params)
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in!'
    else

      flash.now[:alert] = 'Invalid name'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end

  private

  def log_params
    params.permit(:name)
  end
end
