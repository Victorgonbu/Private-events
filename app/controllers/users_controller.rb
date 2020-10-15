class UsersController < ApplicationController
  include ApplicationHelper
  before_action :not_logged, except: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User #{@user.name} created successfully"
      redirect_to events_path
    else
      render :new
    end
  end

  def show
    @upcomming_events = current_user.upcomming_events
    @prev_events = current_user.prev_events
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def not_logged
    return unless user_logged_in?

    flash[:alert] = 'Already logged in'
    redirect_to root_path
  end
end
