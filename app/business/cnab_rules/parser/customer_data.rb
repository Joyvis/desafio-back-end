# frozen_string_literal: true

module CustomerData
  attr_reader :transaction

  def build_customer(transaction)
    @transaction = transaction

    build_customer_result
  end

  private

  def build_customer_result
    { customer_id: find_or_create_customer.id }
  end

  def find_or_create_customer
    customer = find
    return customer unless customer.blank?

    create
  end

  def find
    Customer.find_by(identification_document: identification_document)
  end

  def create
    customer = { identification_document: identification_document,
                 name: name,
                 store_name: store_name }

    Customer.create(customer)
  end

  def identification_document
    transaction.slice(19,11).strip
  end

  def name
    transaction.slice(48,14).strip.capitalize
  end

  def store_name
    transaction.slice(62,19).strip.capitalize
  end
end
