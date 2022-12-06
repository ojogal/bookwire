# frozen_string_literal: true

class CreateBookingStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_statuses do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
