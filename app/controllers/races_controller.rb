# frozen_string_literal: true

class RacesController < ApplicationController
  def new
  end

  def time_registration
    @race = Race.includes(:checkpoints).find(params[:race_id])
    # @checkpoints = @race.checkpoints
  end

  def create
    @race = Race.create(race_params)
    redirect_to races_time_registration_path(race_id: @race.id)
  end

  def start
    @race = Race.includes(:checkpoints).find(params[:race_id])
    @race.update(
      start_datetime: helpers.timestamp_to_time(params[:start_time]).to_datetime.in_time_zone('America/Santiago'),
    )
  end

  def finish
    @race = Race.includes(:checkpoints).find(params[:race_id])
    add_checkpoint(@race, params)
    @race.update(
      end_datetime: helpers.timestamp_to_time(params[:end_time]).to_datetime.in_time_zone('America/Santiago'),
    )
  end

  def checkpoint
    @race = Race.includes(:checkpoints).find(params[:race_id])
    add_checkpoint(@race, params)
    @race = Race.includes(:checkpoints).find(params[:race_id])
  end

  def show
    Rails.logger.debug params
    @race = Race.includes(:checkpoints).find(params[:race_id])
  end

  private

  def add_checkpoint(race, params)
    race.checkpoints.create(
      start: helpers.timestamp_to_time(params[:start_checkpoint]).to_datetime.in_time_zone('America/Santiago'),
      end: helpers.timestamp_to_time(params[:end_checkpoint]).to_datetime.in_time_zone('America/Santiago'),
      arm_start:
        (
          if params[:arm_start] == 'null'
            nil
          else
            helpers.timestamp_to_time(params[:arm_start]).to_datetime.in_time_zone('America/Santiago')
          end
        ),
      arm_end:
        (
          if params[:arm_end] == 'null'
            nil
          else
            helpers.timestamp_to_time(params[:arm_end]).to_datetime.in_time_zone('America/Santiago')
          end
        ),
      elapsed_time:
        helpers.timestamp_to_time(params[:end_checkpoint]).to_datetime.in_time_zone('America/Santiago') -
          helpers.timestamp_to_time(params[:start_checkpoint]).to_datetime.in_time_zone('America/Santiago'),
    )
  end

  def race_params
    params.permit(:start, :end, :pool_type, :proof_type, :style, :distance)
  end
end
