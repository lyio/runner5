class RunsRenameTypeToRunType < ActiveRecord::Migration[5.0]
  def change
    change_table :runs do |t|
      t.rename :type, :run_type
    end
  end
end
