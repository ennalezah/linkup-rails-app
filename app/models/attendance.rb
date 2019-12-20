class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def self.add_user_to_group(attendance)
    # if user attends event but doesn't have membership with event group, it will add user to that group
    event_group = Event.find(attendance.event_id).group
    user = User.find(attendance.user_id)

    if !event_group.users.include?(user)
      event_group.users << user
    end    
  end
end
