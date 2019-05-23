class CreateUserLists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lists do |t|
      t.string :channel_id
      t.string :name
      t.integer :dual_score

      t.timestamps
    end
  end
end
