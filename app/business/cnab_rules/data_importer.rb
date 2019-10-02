# frozen_string_literal: true

module CnabRules
  class DataImporter
    attr_reader :file_data

    def self.import(file_data = nil)
      return [] unless file_data.respond_to? :read
      file_data = file_data.read
      new(file_data).import
    end

    def initialize(file_data = nil)
      @file_data = file_data
    end

    def import
      !save_data.include? false
    end

    private

    def save_data
      file_data.split("\n").map do |line|
        transaction = CnabRules::DataParser.parse(normalize_encode(line))
        transaction.save
      end
    end

    def normalize_encode(string)
      string.encode("ASCII-8BIT").force_encoding('utf-8')
    rescue Encoding::UndefinedConversionError
      string
    end
  end
end
