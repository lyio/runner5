class AddShoeReferenceToRuns < ActiveRecord::Migration[5.0]
  def change
    add_reference :runs, :shoe, foreign_key: true
  end
end
