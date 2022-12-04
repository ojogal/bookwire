class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.float :amount, null: false
      t.belongs_to :booking, null: false, foreign_key: true
      t.belongs_to :currency, null: false, foreign_key: true
      t.timestamps
    end
  end
end
