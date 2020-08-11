class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]

  def new
    @event = Event.new
  end

  def index
  end

  def create
    @event = Event.new(params_event)
    @event.admin_id = current_user.id
    @event.save
    if @event.save
      redirect_to event_path(@event.id)
    else
      flash.now[:danger] = "N'arrive pas à sauvegarder."
      render action: "new"
    end
  end

  def show
  end


  def params_event
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location )
  end

end
