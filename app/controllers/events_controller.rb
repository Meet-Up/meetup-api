class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def show
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: 201
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
    render_404 if @event.nil?
  end

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :hours,
      :password,
      dates_attributes: [
        :id,
        :open_times
      ])
  end
end
