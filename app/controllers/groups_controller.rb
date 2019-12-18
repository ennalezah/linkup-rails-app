class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index 
    @groups = Group.all
  end

  def show
    @events = @group.events
  end

  def new
    @group = Group.new(creator: current_user.name)
  end

  def create 
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "You've successfully created a new group"
      redirect_to group_path(@group)
    else
      flash[:alert] = "There were some errors on your form"
      render :new
    end
  end

  def edit 
  end

  def update
    @group.update(group_params)

    if @group.save
      flash[:notice] = "You've successfully updated your group"
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
end
