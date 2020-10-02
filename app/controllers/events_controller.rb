class EventsController < ApplicationController
  include ApplicationHelper
  def new
    @event =  Event.new
  end

  def index
    @events = Event.all
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
  end

  private
  def event_params
    params.require(:event).permit(:name, :location, :date)
  end
end
