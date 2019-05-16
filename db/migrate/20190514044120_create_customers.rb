class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :identification_document, null: false
      t.string :name, null: false
      t.string :store_name, null: false
      t.timestamps
    end
  end
end
