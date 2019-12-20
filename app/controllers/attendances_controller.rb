class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :destroy]

  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      redirect_to event_path(@attendance.event_id)
    else
      flash[:alert] = "There was a problem submitting your request. Please try again."
      redirect_to events_path
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:user_id, :event_id)
  end
end
