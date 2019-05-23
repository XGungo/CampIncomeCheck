class CreateTeamLists < ActiveRecord::Migration[5.2]
  def change
    create_table :team_lists do |t|
      t.string :channel_id
      t.string :team_id
      t.string :team_name
      t.integer :total_score

      t.timestamps
    end
  end
end
