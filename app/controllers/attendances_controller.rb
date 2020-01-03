class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save      
      Attendance.add_user_to_group(@attendance)
      redirect_to event_path(@attendance.event_id)
    else
      flash[:alert] = "There was a problem submitting your request. Please try again."
      redirect_to events_path
    end
  end

  def destroy
    @attendance = Attendance.find_by(user_id: current_user.id, event_id: params[:id])
    @attendance.destroy
    redirect_to root_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:user_id, :event_id)
  end
end
