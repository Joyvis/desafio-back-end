class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.datetime :transaction_date, null: false
      t.float :value, null: false
      t.string :card_number, null: false
      t.references :customer, unique: true
      t.timestamps
    end
  end
end
