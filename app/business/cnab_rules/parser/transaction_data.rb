# frozen_string_literal: true

module TransactionData
  attr_reader :transaction

  def build_transaction(transaction)
    @transaction = transaction

    build_transaction_result
  end

  private

  def build_transaction_result
    { transaction_date: transaction_date,
      value: value,
      card_number: card_number }
  end

  def transaction_date
    date + hour
  end

  def date
    string_date = transaction.slice(1,8)
                                .insert(4, '-')
                                .insert(7, '-')

    Time.zone.parse(string_date).to_date
  end

  def hour
    string_hour = transaction.slice(42,6)
                                .insert(2, ':')
                                .insert(5, ':')

    Time.zone.parse(string_hour).seconds_since_midnight.seconds
  end

  def value
    transaction.slice(9, 10).to_f / 100
  end

  def card_number
    transaction.slice(30, 12)
  end
end
