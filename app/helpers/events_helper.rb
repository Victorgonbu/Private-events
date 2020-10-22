module EventsHelper
  def owner_invite
    render 'invitations/new' if @event.creator == current_user
  end

  def display_upcomming_h1
    content_tag(:h1, 'Upcomming Events') if Event.upcomming.any?
  end

  def display_prev_h1
    content_tag(:h1, 'Past Events') if Event.past.any?
  end

  def display_all_events(events)
    render 'allevents' if events.any?
  end

  def display_back_arrow
    render 'back' if user_logged_in?
  end

  def display_attendees(event)
    render 'attendee_list' if event.attendees.any?
  end
end
