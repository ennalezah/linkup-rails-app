module ApplicationHelper
  def count_users(resource)
    pluralize(resource.users.count, 'group member')
  end
end
