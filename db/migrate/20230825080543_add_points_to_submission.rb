class AddPointsToSubmission < ActiveRecord::Migration[7.0]
  def change
    add_column :submissions, :points, :integer
  end
end
