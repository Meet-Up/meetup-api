class ParticipantsController < ApplicationController
  before_action :set_event
  before_action :set_participant, only: [:show, :update, :destroy]
  before_action :check_password!, only: [:update, :destroy]

  def index
    render json: @event.participants
  end

  def show
    render json: @participant
  end

  def create
    @participant = @event.participants.build(participant_params)
    save_or_fail! @participant
  end

  def update
    @participant.assign_attributes(participant_params)
    save_or_fail! @participant
  end

  def destroy
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

  def check_password!
    password = params[:participant].delete :password if params[:participant]
    render_403 unless @participant.authenticate(password)
  end

  def participant_params
    params.require(:participant).permit(:name, :password,
      availabilities_attributes: [:id, :times, :event_date_id])
  end
end
