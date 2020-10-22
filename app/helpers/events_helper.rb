module EventsHelper

  def owner_invite
    render 'invitations/new' if @event.creator == current_user
  end

  def display_upcomming_h1
    if Event.upcomming.any?
      content_tag(:h1, "Upcomming Events")
    end

  end

  def display_prev_h1
    if Event.past.any?
      content_tag(:h1, "Past Events")
    end
  end

  def display_all_events(events)
      render 'allevents' if events.any?
  end


end
