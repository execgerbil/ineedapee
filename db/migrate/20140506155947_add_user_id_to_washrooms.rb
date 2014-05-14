class AddUserIdToWashrooms < ActiveRecord::Migration
  def change
    add_column :washrooms, :user_id, :integer, index: true
  end
end
