class RemoveTypeFromHomes < ActiveRecord::Migration[5.2]
  def change
    remove_column :homes, :type, :string
  end
end
