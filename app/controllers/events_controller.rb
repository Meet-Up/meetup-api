class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :check_password!, only: [:update, :destroy]

  def show
    render json: @event.as_json.merge({ participants: @event.participants })
  end

  def create
    @event = Event.new(event_params)
    save_or_fail! @event
  end

  def update
    @event.assign_attributes(event_params)
    save_or_fail! @event
  end

  def destroy
    @event.destroy
    head :no_content
  end

  private

  def set_event
    @event = Event.find_by_token(params[:id]) rescue nil
    render_404 if @event.nil?
  end

  def check_password!
    password = params[:event].delete :current_password if params[:event]
    render_403 unless @event.authenticate(password)
  end

  def event_params
    params.require(:event).permit(:title, :description, :duration, :password,
      dates_attributes: [:id, :times, :date])
  end
end
