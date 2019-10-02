# frozen_string_literal: true

module TransactionTypeData
  attr_reader :transaction

  def build_transaction_type(transaction)
    @transaction = transaction

    build_transaction_type_result
  end

  private

  def build_transaction_type_result
    { transaction_type_id: transaction_type_id, value: value }
  end

  def transaction_type
    @transaction_type ||=
      TransactionType.find_by(type_external_id: type_external_id)
  end

  def transaction_type_id
    transaction_type&.id
  end

  def value
    normalize_value(transaction.slice(9, 10).to_f / 100)
  end

  def normalize_value(value)
    return (value * -1) if transaction_type.direction == :out

    value
  end

  def type_external_id
    transaction.slice(0)
  end
end
