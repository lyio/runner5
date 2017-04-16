class RunType < ApplicationRecord
  validates :name, :heartrate, presence: true
  has_many :runs, :class_name => "Run", :inverse_of => :run_type
end
