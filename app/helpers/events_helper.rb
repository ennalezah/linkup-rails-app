module EventsHelper
  def organizer_name(event)
    @user = User.find(event.organizer)
    first_name(@user) if @user
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
end
