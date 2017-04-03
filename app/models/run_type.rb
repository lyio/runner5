class RunType < ApplicationRecord
  has_many :runs, :class_name => "Run", :inverse_of => :run_type
end
