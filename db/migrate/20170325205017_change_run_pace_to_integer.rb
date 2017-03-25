class ChangeRunPaceToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :runs, :pace, :integer
  end
end
