class EventsController < ApplicationController
  include ApplicationHelper
  before_action :require_login, except: [:index, :show]
  def new
    @event =  Event.new
  end

  def index
    @events = Event.all
    @upcomming_events = Event.upcomming
    @prev_events = Event.past
  end

  def create
  @event = current_user.events.build(event_params)

  if  @event.save
    @event.save
    redirect_to current_user, notice: "Event created"
  else
    flash.now[:alert] = "Invalid event"
    render :new
  end

  end

  def show
    @event = Event.find(params[:id])
    cookies[:event_id] = @event.id
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
  def require_login
    unless user_logged_in?
      flash[:alert] = "You must be logged in to create a new event"
      redirect_to root_path
    end
  end
end
