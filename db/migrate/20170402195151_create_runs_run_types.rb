class CreateRunsRunTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :runs_run_types do |t|
      t.references :runs, foreign_key: true
      t.references :run_types, foreign_key: true
    end
  end
end
