class CreateUsersLeagues < ActiveRecord::Migration[7.0]
  def change
    create_table :users_leagues do |t|
      t.references :user, null: false, foreign_key: true
      t.references :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
