class Transaction < ApplicationRecord
  belongs_to :customer
  belongs_to :transaction_type

  validates_presence_of :card_number, :value, :transaction_date, :customer_id,
                        :transaction_type_id
end
