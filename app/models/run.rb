class Run < ApplicationRecord
  validates :date, :heartrate, :run_type, :duration, :distance, presence: true

  belongs_to :user

  def duration=(value)
    self[:duration] = DurationConversions.convert_duration value
  end

  def pace=(value)
    self[:pace] = DurationConversions.convert_duration value
  end

  def format_pace
    DurationConversions.format_string self[:pace]
  end

  def format_duration
    DurationConversions.format_string self[:duration]
  end

end
