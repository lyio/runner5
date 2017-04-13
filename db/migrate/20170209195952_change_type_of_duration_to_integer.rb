class ChangeTypeOfDurationToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :runs, :date, :datetime
  end
end
