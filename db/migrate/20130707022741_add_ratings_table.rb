class AddRatingsTable < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :hate_id
      t.integer :user_id
      t.integer :hate_up
      t.integer :hate_down
      t.timestamps
    end
  end
end
