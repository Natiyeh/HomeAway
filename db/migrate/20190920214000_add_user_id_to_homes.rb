class AddUserIdToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :user_id, :bigint
  end
end
