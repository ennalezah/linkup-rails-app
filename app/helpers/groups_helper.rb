module GroupsHelper
  def creator_options(group)
    if is_creator(group)
      "<hr>".html_safe +
      (link_to 'Add Event', new_group_event_path(group), class: 'button is-small') + " " +
      (link_to 'Edit', edit_group_path(group), class: 'button is-small is-light is-link') + " " +
      (link_to 'Delete', group_path(group), method: :delete, data: { confirm: "Are you sure you want to delete #{group.name}?" }, class: 'button is-small is-light is-danger')
    end
  end

  def is_creator(group)
    true if user_signed_in? && (group.creator == current_user.id)
  end

  def creator_name(group)
   @user = User.find_by(id: group.creator)
   (link_to first_name(@user), user_path(@user), class: 'has-text-weight-medium') if @user
  end

  def role(group)
    if user.id == user.group.creator
      "Creator"
    else
      "Member"
    end
  end

  def become_member(group)
    if user_signed_in?
      @current_membership = Membership.find_by(user_id: current_user.id, group_id: group.id)

      if @current_membership || is_creator(group)
        "&nbsp;".html_safe
      else 
        @membership = Membership.new(user_id: current_user.id, group_id: group.id)
        "<h4 class='title is-4 has-text-weight-medium'>Join Us</h4>".html_safe + (render 'memberships/form', membership: @membership)
      end
    end
  end
  
  # def become_member(group)
  #   @current_membership = Membership.find_by(user_id: current_user.id, group_id: group.id)

  #   if @current_membership
  #     "<hr>".html_safe +
  #     (link_to 'Leave group', membership_path(@current_membership), method: :delete, data: { confirm: "Are you sure you want to leave #{group.name}?" }, class: 'button is-small is-danger is-light')
  #   else 
  #     @membership = Membership.new(user_id: current_user.id, group_id: group.id)
  #     "<h3>Join Us</h3><br>".html_safe + (render 'memberships/form', membership: @membership)
  #   end
  # end
end