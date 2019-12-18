class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index 
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new(creator: current_user.name)
  end

  def create 
    @group = Group.new(group_params)

    if @group.save
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
  end

  def destroy
  end

  private

    def group_params
      params.require(:group).permit(:name, :description, :city, :state, :creator)
    end

    def set_group
      @group = Group.find(params[:id])
    end
end
