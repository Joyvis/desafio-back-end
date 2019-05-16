class AddTypeToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :transaction_type, unique: true
  end
end
