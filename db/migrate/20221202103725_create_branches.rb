# frozen_string_literal: true

class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :alias, null: false
      t.integer :floors, null: false
      t.belongs_to :brand, null: false, foreign_key: true
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
