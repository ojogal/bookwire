class CreateUnitTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :unit_types do |t|
      t.string :title, null: false
      t.string :description

      t.timestamps
    end
  end
end
