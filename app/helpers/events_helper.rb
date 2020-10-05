module EventsHelper
  def owner_invite
    if @event.creator == current_user
      render "invitations/new", :locals => {:item => @event}
    end
  end
  end
