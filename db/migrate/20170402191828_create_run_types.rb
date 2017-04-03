class CreateRunTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :run_types do |t|
      t.string :name
      t.float :heartrate

      t.timestamps
    end
  end
end
