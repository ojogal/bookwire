# frozen_string_literal: true

class CreateUserBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :user_brands do |t|
      t.belongs_to :brand, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
