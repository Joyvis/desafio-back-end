class Customer < ApplicationRecord
  has_many :transactions

  validates_presence_of :name, :identification_document, :store_name
  validates_uniqueness_of :identification_document, case_insensitive: true
end
