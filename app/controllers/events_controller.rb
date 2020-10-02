class EventsController < ApplicationController
  include ApplicationHelper
  def new
    @event =  Event.new
  end

  def index
    @events = Event.all
  end

  def create
  if  @event = current_user.events.build(params[:events])
    redirect_to current_user, notice: "Event created"
  else
    flash.now[:alert] = "Invalid event"
    render :new
  end

  end

  def show
  end
end
