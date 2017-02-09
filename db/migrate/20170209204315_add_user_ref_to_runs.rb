class AddUserRefToRuns < ActiveRecord::Migration[5.0]
  def change
    add_reference :runs, :user, foreign_key: true
  end
end
