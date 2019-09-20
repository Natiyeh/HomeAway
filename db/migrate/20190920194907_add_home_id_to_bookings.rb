class AddHomeIdToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :home_id, :bigint
    add_column :bookings, :user_id, :bigint
  end
end
