module EventsHelper
  
  def owner_invite
    render 'invitations/new' if @event.creator == current_user
  end

end
