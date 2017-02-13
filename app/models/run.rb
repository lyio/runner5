class Run < ApplicationRecord
  validates :date, :heartrate, :run_type, :duration, :distance, presence: true

  belongs_to :user
end
