class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.string :theme
      t.string :description
      t.references :league, null: false, foreign_key: true
      t.string :current
      t.integer :round
      t.datetime :submission_deadline
      t.datetime :voting_deadline
      t.boolean :completed

      t.timestamps
    end
  end
end
