class CreateShoes < ActiveRecord::Migration[5.0]
  def change
    create_table :shoes do |t|
      t.string :name
      t.date :bought_when

      t.timestamps
    end
  end
end
