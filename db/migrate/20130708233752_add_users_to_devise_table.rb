class AddUsersToDeviseTable < ActiveRecord::Migration
    def change
      add_column :users, :username, :string
      add_column :users, :status, :string
      add_column :users, :age, :integer
      add_column :users, :location, :text
      add_column :users, :gender, :string
      add_column :users, :image, :text
  end
end
