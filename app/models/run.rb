class Run < ApplicationRecord
  include Filterable

  validates :date, :heartrate, :name, :duration, :distance, presence: true

  belongs_to :user
  belongs_to :run_type, required: false

  default_scope { order date: :desc }
  scope :own, -> (user) { where(user_id: user.id)  }
  scope :type, -> (run_type_id) { where(run_type_id: run_type_id) }

  def self.totals user
    [
      self.own(user).sum('distance'),
      self.own(user).count,
      self.overall_time(user)
    ]
  end

  # unscoped
  def self.overall_distance
    Run.sum('distance')
  end

  # unscoped
  def self.overall_count
    Run.count
  end

  def self.overall_time user
    time = Run.own(user).sum('duration')
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
