class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_creator, only: [:edit, :update, :destroy]

  def index 
    @groups = Group.all
  end

  def show
    @events = @group.events
    @users = @group.users
  end

  def new
    @group = Group.new(creator: current_user.id)
  end

  def create 
    @group = Group.new(group_params)

    if @group.save
      @group.users << current_user
      redirect_to group_path(@group)
    else
      flash[:alert] = "There were some errors on your form. Review the messages below:"
      render :new
    end
  end

  def edit 
  end

  def update
    @group.update(group_params)

    if @group.save
      redirect_to group_path(@group)
    else
      flash[:alert] = "There were some errors updating your group"
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path
  end

  private

    def group_params
      params.require(:group).permit(:name, :description, :city, :state, :creator)
    end

    def set_group
      @group = Group.find(params[:id])
    end

    def require_creator
      if user_signed_in? && (@group.creator != current_user.id)
        flash[:alert] = "You don't have permission to view that page"
        redirect_to root_path
      end
    end
end