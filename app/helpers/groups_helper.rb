module GroupsHelper
  def creator_options(group)
    if user_signed_in? && group.creator == current_user.name
      "<hr>".html_safe +
      (link_to 'Add Event', new_group_event_path(group), class: 'button is-small') + " " +
      (link_to 'Edit', edit_group_path(group), class: 'button is-small is-light is-link') + " " +
      (link_to 'Delete', group_path(group), method: :delete, data: { confirm: "Are you sure you want to delete this group?" }, class: 'button is-small is-light is-danger')
    end
  end
end
