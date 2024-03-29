class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.date :date
      t.integer :resting_pulse
      t.float :weight
      t.string :type
      t.integer :pace
      t.integer :heartrate
      t.integer :duration
      t.float :distance
      t.string :weather
      t.text :remark

      t.timestamps
    end
  end
end
