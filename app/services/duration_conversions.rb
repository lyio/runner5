class DurationConversions
  PATTERN = "%02d"

  def self.convert_duration(dur)
    durations = (dur.split(':').map { |d| d.to_i  }).reverse
    in_seconds = parse_hours(durations[2]) + parse_minutes(durations[1]) + parse_seconds(durations[0])

    in_seconds
  end

  def self.format_string dur
    return unless dur

    seconds = dur % 60
    minutes = (dur - seconds) / 60
    hours = (dur - seconds - ((dur - seconds) / 60)) / 3600

    h = "#{PATTERN % hours}:" if hours != 0
    m = "#{PATTERN % minutes}:" if minutes != 0
    s = "#{PATTERN % seconds}" if seconds != 0

    "#{h}#{m}#{s}"
  end

private
  def self.parse_hours dur
    dur ? dur * 3600 : 0
  end

  def self.parse_minutes dur
    dur ? dur * 60 : 0
  end

  def self.parse_seconds dur
    dur ? dur : 0
  end
end
