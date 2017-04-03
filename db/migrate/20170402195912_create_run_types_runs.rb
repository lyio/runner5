class CreateRunTypesRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :run_types_runs do |t|
      t.references :runs, foreign_key: true
      t.references :run_types, foreign_key: true
    end
  end
end
