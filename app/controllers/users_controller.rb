class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @groups = @user.groups
    @events = @user.events.past
  end
end