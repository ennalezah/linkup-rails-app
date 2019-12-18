class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show 
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "You've successfully added an event"
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
      params.require(:event).permit(:name, :details, :start_date, :end_date, :location, :city, :state, :group_id)
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
