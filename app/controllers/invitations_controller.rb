class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    user = User.find_by(name: inv_params[:name])
    event_id = inv_params[:event_id]

    if user
      @invitation = Invitation.create(event_id: event_id, attendee_id: user.id)
      redirect_to event_path(event_id), notice: "#{user.name} was invited!"

    else
      redirect_to event_path(event_id), alert: 'Invalid user name'
    end
  end

  private

  def inv_params
    params.permit(:name, :event_id)
  end
end
