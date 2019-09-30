class AddHomeTypeToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :home_type, :string
  end
end
