class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.integer :seats, null: false
      t.boolean :is_reserved, default: false
      t.integer :floor
      t.belongs_to :unit_type, null: false, foreign_key: true
      t.belongs_to :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
