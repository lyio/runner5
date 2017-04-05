class Run < ApplicationRecord
  validates :date, :heartrate, :name, :duration, :distance, presence: true

  belongs_to :user
  belongs_to :run_type, required: false

  default_scope { order date: :desc }

  def self.overall_distance
    Run.sum('distance')
  end

  def self.overall_count
    Run.count
  end

  def self.overall_time
    time = Run.sum('duration')
    p time
    DurationConversions.format_string(time)
  end

  def duration=(value)
    self[:duration] = DurationConversions.convert_duration value
  end

  def pace=(value)
    self[:pace] = DurationConversions.convert_duration value
  end

  def format_pace
    Time.at(self[:pace]).utc.strftime("%M:%S")
  end

  def format_duration
    DurationConversions.format_string self[:duration]
  end

  def format_date
    DurationConversions.format_date self[:date]
  end

end
