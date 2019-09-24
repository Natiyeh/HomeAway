class AddPhotoToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :photo, :string
  end
end
