module EventsHelper
  attr_reader :get_event_id
  def owner_invite
    render 'invitations/new', locals: { item: @event } if @event.creator == current_user
  end

end
