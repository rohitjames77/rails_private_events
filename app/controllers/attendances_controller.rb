class AttendancesController < ApplicationController
  def index
    @attendances = Attendances.all
  end

  def create
    @attendance = current_user.attendances.build(attended_event_id: params[:event_id])

    if @attendance.save
      redirect_to @attendance.attended_event, notice: "You are now attending this event!"
    else
      redirect_to @attendance.attended_event, alert: "Could not attend this event."
    end
  end
end
