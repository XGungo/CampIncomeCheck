class CreateAdminLists < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_lists do |t|
      t.string :channel_id
      t.string :name

      t.timestamps
    end
  end
end
