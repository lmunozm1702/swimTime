module RacesHelper
  def timestamp_to_time(timestamp)
    seconds = (timestamp.to_i / 1000) % 60
    minutes = (timestamp.to_i / 60_000) % 60
    hours = (timestamp.to_i / 3_600_000) % 24
    milliseconds = (timestamp.to_i % 1000) / 1
    return "#{hours}:#{minutes}:#{seconds}.#{milliseconds}".to_datetime
  end
end
