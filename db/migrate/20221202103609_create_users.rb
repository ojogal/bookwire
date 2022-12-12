# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone, null: false, unique: true
      t.string :email, null: false
      t.index :email, unique: true
      t.belongs_to :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end