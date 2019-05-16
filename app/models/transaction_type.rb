class TransactionType < ApplicationRecord
  has_many :transactions
  as_enum :direction, %i[in out], prefix: true

  validates_presence_of :name, :type_external_id, :direction

  validates_uniqueness_of :type_external_id
end
