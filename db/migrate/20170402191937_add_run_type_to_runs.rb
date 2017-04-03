class AddRunTypeToRuns < ActiveRecord::Migration[5.0]
  def change
    add_reference :runs, :run_type, index: true, foreign_key: true
  end
end
