class RenameRunTypeToName < ActiveRecord::Migration[5.0]
  def change
    change_table :runs do |t|
      t.rename :run_type, :name
    end
  end
end
