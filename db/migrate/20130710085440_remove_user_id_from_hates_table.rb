class RemoveUserIdFromHatesTable < ActiveRecord::Migration
  def change
      remove_column :hates, :user_id
  end
end
