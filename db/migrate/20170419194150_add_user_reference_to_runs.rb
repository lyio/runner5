class AddUserReferenceToRuns < ActiveRecord::Migration[5.0]
  def change
    add_reference :shoes, :user, foreign_key: true
  end
end
