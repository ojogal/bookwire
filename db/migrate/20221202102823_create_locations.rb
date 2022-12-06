# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :district
      t.string :street
      t.string :building

      t.timestamps
    end
  end
end
