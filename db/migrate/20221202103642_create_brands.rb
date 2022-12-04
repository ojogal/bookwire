class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :title, null: false
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
