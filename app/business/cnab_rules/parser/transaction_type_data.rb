# frozen_string_literal: true

module TransactionTypeData
  attr_reader :transaction

  def build_transaction_type(transaction)
    @transaction = transaction

    build_transaction_type_result
  end

  private

  def build_transaction_type_result
    { transaction_type_id: transaction_type_id}
  end

  def transaction_type_id
    TransactionType.find_by(type_external_id: type_external_id)&.id
  end

  def type_external_id
    transaction.slice(0)
  end
end
