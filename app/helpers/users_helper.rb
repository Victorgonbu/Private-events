module UsersHelper
  def display_hosted_events
    render 'hosted_events' if current_user.events.any?
  end

  def display_invited_events
    render 'invited_events' if current_user.attended_events.any?
  end
end
