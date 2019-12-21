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

  def hosting_group(event)
    @group = event.group
    link_to @group.name, group_path(@group), class: 'has-text-weight-medium'
  end

  def upcoming(event)
    event.date.future?
  end

  def date(event)
    event.date.strftime("%A, %B %e, %Y")
  end

  def start_time(event)
    event.try(:start_time).try(:strftime, ("%l:%M %P"))
    # event.start_time.strftime("%l:%M %P")
  end

  def end_time(event)
    event.try(:end_time).try(:strftime, ("%l:%M %P"))
    # event.end_time.strftime("%l:%M %P")
  end

  def start_end_time(event)
    "#{start_time(event)} - #{end_time(event)}"
  end

  def rsvp(event)
    if user_signed_in?
      @current_attendance = Attendance.find_by(user_id: current_user.id, event_id: event.id)

      if @current_attendance || is_organizer(event)
        "&nbsp;".html_safe
      else 
        @attendance = Attendance.new(user_id: current_user.id, event_id: event.id)
        "<br>".html_safe + (render 'attendances/form', attendance: @attendance)
      end
    end
  end
end
