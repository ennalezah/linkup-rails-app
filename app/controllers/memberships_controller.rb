class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :destroy]

  def index

  end

  def create
    @membership = Membership.new(membership_params)

    if @membership.save
      redirect_to group_path(@membershp.group_id)
    else
      flash[:alert] = "There was a problem submitting your request. Please try again."
      redirect_to groups_path
    end
  end

  private

    def membership_params
      params.require(:membership).require(:interests, :user_id, :group_id)
    end
end