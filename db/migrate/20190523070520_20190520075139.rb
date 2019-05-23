class CreateTeamLists < ActiveRecord::Migration[5.2]
  def change
    create_table :team_lists do |t|
      t.string :team_id
      t.string :team_name
      t.integer :score

      t.timestamps
    end
  end
end