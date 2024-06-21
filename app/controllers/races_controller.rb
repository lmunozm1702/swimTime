class RacesController < ApplicationController
  def new
  end

  def time_registration
    pp params
    @race = Race.find(params[:race_id]) #includes(:checkpoints)
    #@checkpoints = @race.checkpoints
  end

  def create
    pp race_params
    @race = Race.create(race_params)
    redirect_to races_time_registration_path(race_id: @race.id)
  end

  def start
    pp '----------------------------------------'
    pp params[:start_time].to_datetime
    @race = Race.find(params[:race_id])
    @race.update(start_datetime: params[:start_time].to_datetime)
  end

  private

  def race_params
    params.permit(:start, :end, :pool_type, :proof_type, :style, :distance)
  end
end
