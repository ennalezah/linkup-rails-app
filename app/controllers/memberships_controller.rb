class MembershipsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :destroy]

  def index
  end

  def create
    @membership = Membership.new(membership_params)

    if @membership.save
      redirect_to group_path(@membership.group_id)
    else
      flash[:alert] = "There was a problem submitting your request. Please try again."
      redirect_to groups_path
    end
  end

  def destroy 
    @membership = Membership.find_by(user_id: current_user.id, group_id: params[:id])
    @membership.destroy
    redirect_to root_path
  end

  private

  def membership_params
    params.require(:membership).permit(:interests, :user_id, :group_id)
  end
end