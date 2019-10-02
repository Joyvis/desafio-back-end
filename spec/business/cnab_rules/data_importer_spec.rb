# frozen_string_literal: true

require 'rails_helper'

describe CnabRules::DataImporter, type: :business do
  describe 'importing transactions from cnab file' do
    subject { described_class.import(file) }
    let(:transactions) { Transaction.all }

    context 'with a valid file' do
      let(:file) { file_fixture('CNAB.txt') }

      it 'all transactions are imported' do
        is_expected.to be_truthy
        expect(file.read.split("\n").size).to eq(transactions.size)
      end
    end

    context 'with a invalid file' do
      let(:file) { file_fixture('INVALID_CNAB.txt') }

      it 'all transactions are not imported' do
        is_expected.to be_falsey
      end
    end
  end
end
