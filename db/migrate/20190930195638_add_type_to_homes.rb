class AddTypeToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :type, :string
    add_column :homes, :guest, :integer
    add_column :homes, :bedroom, :integer
    add_column :homes, :bed, :integer
    add_column :homes, :bath, :integer
    add_column :homes, :rate, :integer
    add_column :homes, :description, :text
  end
end
