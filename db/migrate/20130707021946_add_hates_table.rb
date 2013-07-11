class AddHatesTable < ActiveRecord::Migration
 def change
    create_table :hates do |t|
      t.integer :user_id
      t.string :category
      t.text :post
      t.string :hate_rate
      t.timestamps
    end
  end
end
