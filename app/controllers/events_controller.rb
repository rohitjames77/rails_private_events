class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy

    redirect_to events_path, notice: "Event deleted successfully."
  end

  private

  def event_params
    params.require(:event).permit(
      :event_name,
      :date_of_event,
      :time_of_event,
      :location,
      :no_of_attendence,
      :ticket_price
    )
  end
end
