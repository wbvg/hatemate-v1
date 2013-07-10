class AddUsersHatesTable < ActiveRecord::Migration
  def change
    create_table :hates_users, :id => false do |t|
      t.integer :hate_id
      t.integer :user_id
    end
  end
end
