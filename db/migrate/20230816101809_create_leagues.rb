class CreateLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :description
      t.integer :no_player
      t.integer :max_players
      t.integer :no_rounds

      t.timestamps
    end
  end
end
