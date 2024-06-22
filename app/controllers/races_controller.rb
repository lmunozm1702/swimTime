class RacesController < ApplicationController
  def new
  end

  def time_registration
    @race = Race.find(params[:race_id]) #includes(:checkpoints)
    #@checkpoints = @race.checkpoints
  end

  def create
    @race = Race.create(race_params)
    redirect_to races_time_registration_path(race_id: @race.id)
  end

  def start
    @race = Race.find(params[:race_id])
    @race.update(
      start_datetime: helpers.timestamp_to_time(params[:start_time]).to_datetime.in_time_zone('Chile/Continental'),
    )
  end

  def finish
    @race = Race.find(params[:race_id])
    @race.update(
      end_datetime: helpers.timestamp_to_time(params[:end_time]).to_datetime.in_time_zone('Chile/Continental'),
    )
  end

  def checkpoint
    pp '+++++++++++++++++++++++++++++++++++++++++++++'
    pp helpers.timestamp_to_time(params[:start_checkpoint]).to_datetime.in_time_zone('Chile/Continental')
  end

  private

  def race_params
    params.permit(:start, :end, :pool_type, :proof_type, :style, :distance)
  end
end
