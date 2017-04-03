class DeleteRunTypesRuns < ActiveRecord::Migration[5.0]
  def change
    drop_table :run_types_runs
    drop_table :runs_run_types
  end
end
