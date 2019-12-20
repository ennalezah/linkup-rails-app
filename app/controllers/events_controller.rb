class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    params[:user_id] ? (@events = current_user.events) : (@events = Event.all)
  end

  def show 
    @users = @event.users
  end

  def new
    if params[:group_id]
      @event = Event.new(organizer: current_user.id, group_id: params[:group_id])
    else 
      @event = Event.new
    end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      @event.users << current_user
      redirect_to event_path(@event)
    else
      flash[:alert] = "There were some errors on your form"
      render :new
    end
  end

  def edit 
  end

  def update
    @event.update(event_params)

    if @event.save
      flash[:notice] = "You've successfully updated your event"
      redirect_to event_path(@event)
    else
      flash[:alert] = "There were some errors updating your event"
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

    def event_params
      params.require(:event).permit(:name, :details, :date, :start_time, :end_time, :location, :city, :state, :organizer, :group_id)
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
