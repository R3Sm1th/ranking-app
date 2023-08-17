class CreateJoinTableUserLeague < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :leagues do |t|
      t.index [ :user_id, :league_id ]
      t.index [ :league_id, :user_id ]
    end
  end
end
