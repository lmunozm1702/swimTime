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
    pp helpers.timestamp_to_time(params[:start_checkpoint]).to_datetime.in_time_zone('Chile/Continental')
    @race = Race.find(params[:race_id])
    @race.checkpoints.create(
      start: helpers.timestamp_to_time(params[:start_checkpoint]).to_datetime.in_time_zone('Chile/Continental'),
      end: helpers.timestamp_to_time(params[:end_checkpoint]).to_datetime.in_time_zone('Chile/Continental'),
      arm_start:
        (
          if params[:arm_start] == 'null'
            nil
          else
            helpers.timestamp_to_time(params[:arm_start]).to_datetime.in_time_zone('Chile/Continental')
          end
        ),
      arm_end:
        (
          if params[:arm_end] == 'null'
            nil
          else
            helpers.timestamp_to_time(params[:arm_end]).to_datetime.in_time_zone('Chile/Continental')
          end
        ),
    )
  end

  private

  def race_params
    params.permit(:start, :end, :pool_type, :proof_type, :style, :distance)
  end
end
