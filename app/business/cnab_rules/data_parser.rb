# frozen_string_literal: true

module CnabRules
  class DataParser
    include CustomerData
    include TransactionTypeData
    include TransactionData

    attr_reader :transaction

    def self.parse(transaction)
      new(transaction).parse
    end

    def initialize(transaction)
      @transaction = transaction
    end

    def parse
      builded_transaction = init_transaction
      Transaction.new(builded_transaction)
    rescue NoMethodError
      Transaction.new
    end

    private

    def init_transaction
      customer_data = build_customer(transaction)
      transaction_type_data = build_transaction_type(transaction)
      transaction_data = build_transaction(transaction)

      customer_data
        .merge(transaction_type_data)
        .merge(transaction_data)
    end
  end
end
