# frozen_string_literal: true

module CnabRules
  class DataImporter
    attr_reader :file_data

    def self.import(file_data = nil)
      file_data = file_data.read if file_data.respond_to? :read
      new(file_data).import
    end

    def initialize(file_data = nil)
      @file_data = file_data
    end

    def import
      file_data.split("\n").map do |line|
        transaction = CnabRules::DataParser.parse(normalize_encode(line))

        if transaction.save
          transaction
        else
          transacton.errors.message
        end
      end
    end

    private

    def normalize_encode(string)
      string.encode("ASCII-8BIT").force_encoding('utf-8')
    rescue Encoding::UndefinedConversionError
      string
    end
  end
end
