class CreateTransactionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_types do |t|
      t.string :name, null: false
      t.integer :direction_cd, null: false
      t.string :type_external_id
      t.timestamps
    end
  end
end
