class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    user = User.find_by(inv_params)
    event_id = cookies[:event_id]
    cookies[:event_id] = nil
    if user
      @invitation = Invitation.new
      @invitation.event_id = event_id
      @invitation.attendee_id = user.id
      @invitation.save
      redirect_to event_path(event_id), notice: "#{user.name} was invited!"

    else
      redirect_to event_path(event_id), notice: "Invalid user name"
    end
  end
  private
  def inv_params
    params.permit(:name)
  end

end
