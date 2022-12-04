class CreateBookingUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_units do |t|
      t.belongs_to :booking, index: true
      t.belongs_to :unit, index: true

      t.timestamps
    end
  end
end
