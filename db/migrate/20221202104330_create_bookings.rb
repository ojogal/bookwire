class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.timestamp :starts_at, null: false
      t.timestamp :ends_at, null: false
      t.belongs_to :booking_status, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
