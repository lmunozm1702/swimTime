# frozen_string_literal: true

module RacesHelper
  def timestamp_to_time(timestamp)
    seconds = (timestamp.to_i / 1000) % 60
    minutes = (timestamp.to_i / 60_000) % 60
    hours = (timestamp.to_i / 3_600_000) % 24
    milliseconds = (timestamp.to_i % 1000) / 1
    "#{hours}:#{minutes}:#{seconds}.#{milliseconds}".to_datetime
  end

  def strokes_by_minute(checkpoint)
    (Time.zone.at(checkpoint.arm_end - checkpoint.arm_start).seconds_since_midnight.round(3) - 75_600).round(3)
  end

  def stroke_time(checkpoint)
    Time.zone.at(checkpoint.arm_end - checkpoint.arm_start).strftime("%M:%S.%L")
  end

  def button_tooltip(text)
    { 'bs-toggle': "tooltip", 'bs-html': "true", 'bs-title': "#{text}" }
  end
end
