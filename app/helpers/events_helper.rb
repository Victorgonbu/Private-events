module EventsHelper
  def owner_invite
    render 'invitations/new', locals: { item: @event } if @event.creator == current_user
  end
end
