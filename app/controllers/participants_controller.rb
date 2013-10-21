class ParticipantsController < ApplicationController
  before_action :set_event
  before_action :set_participant, only: [:show, :update, :destroy]

  def show
    render json: @participant
  end

  def create
    @participant = @event.participants.build(participant_params)
    save_or_fail! @participant
  end

  private
  def set_participant
    @participant = Participant.find(params[:id]) rescue nil
    render_404 if @participant.nil?
  end

  def set_event
    @event = Event.find_by_token(params[:event_id]) rescue nil
    render_404 if @event.nil?
  end

  def participant_params
    params.require(:participant).permit(:name, :password,
      availabilities_attributes: [:id, :times, :event_date_id])
  end
end
