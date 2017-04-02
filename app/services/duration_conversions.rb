class DurationConversions
  def self.convert_duration(dur)
    durations = (dur.split(':').map { |d| d.to_i  }).reverse
    in_seconds = parse_hours(durations[2]) + parse_minutes(durations[1]) + parse_seconds(durations[0])

    in_seconds
  end

  def self.format_string dur
    return unless dur

    Time.at(dur).utc.strftime("%H:%M:%S")
  end

  def self.format_date date
    date.strftime "%d.%m.%Y %H:%M:%S"
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
