module UsersHelper
  def first_name(user)
    user.name.split.first
  end
end