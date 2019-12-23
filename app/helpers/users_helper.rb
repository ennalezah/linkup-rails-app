module UsersHelper
  def first_name(user)
    user.name.split.first
  end

  def count_groups(user)
    pluralize(user.groups.count, 'Group')
  end

  def count_events(user)
    pluralize(user.events.past.count, 'Event')
  end

  def role(user, group)
    user.id == group.creator ? "Creator" : "Member"
  end

  
end