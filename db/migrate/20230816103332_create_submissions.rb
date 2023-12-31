class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :round, null: false, foreign_key: true
      t.string :moviename
      t.string :movieid
      t.string :comment

      t.timestamps
    end
  end
end
