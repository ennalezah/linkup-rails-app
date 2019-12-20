module EventsHelper
  def organizer_name(event)
    @user = User.find_by(id: event.organizer)
    @user.name if @user
  end

  def is_organizer(event)
    true if user_signed_in? && (event.organizer == current_user.id)
  end

  def organizer_options(event)
    if is_organizer(event)
      "<hr>".html_safe +
      (link_to 'Edit', edit_event_path(event), class: 'button is-small is-light is-link') + " " +
      (link_to 'Delete', event_path(event), method: :delete, data: { confirm: "Are you sure you want to delete #{event.name}?" }, class: 'button is-small is-light is-danger')
    end
  end

  def start_date(event)
    event.start_date.strftime("%A, %B %e, %Y")
  end

  def start_time(event)
    event.start_date.strftime("%l:%M %P")
  end

  def end_date(event)
    event.end_date.strftime("%B %e, %Y")
  end

  def end_time(event)
    event.end_date.strftime("%l:%M %P")
  end

  def start_end_time(event)
    "#{start_time(event)} - #{start_time(event)}"
  end
end
