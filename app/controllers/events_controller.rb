class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :check_password, only: [:update, :destroy]

  def show
    render json: @event
  end

  def create
    @event = Event.new(event_params)
    save_or_fail!
  end

  def update
    @event.update_attributes(event_params)
    save_or_fail!
  end

  def destroy
    @event.destroy
    head :no_content
  end

  private

  def save_or_fail!
    if @event.save
      render json: @event, status: 201
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def set_event
    @event = Event.find(params[:id]) rescue nil
    render_404 if @event.nil?
  end

  def check_password
    render_403 unless @event.authenticate(params[:password])
  end

  def event_params
    params.require(:event).permit(:title, :description, :duration, :password,
      dates_attributes: [:id, :open_times, :date])
  end
end
