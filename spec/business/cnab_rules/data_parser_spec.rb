# frozen_string_literal: true

require 'rails_helper'

describe CnabRules::DataParser, type: :business do
  describe 'parsing a line of file to a transaction object' do
    subject { described_class.parse(line) }

    context 'with valid params' do
      let(:line) do
        file_fixture('CNAB.txt').read.split("\n").first
      end

      it 'transaction builded' do
        is_expected.to be_a Transaction
        expect(subject.value).not_to be_blank
      end
    end

    context 'with invalid params' do
      let(:line) { '' }

      it 'transaction not builded' do
        is_expected.to be_a Transaction
        expect(subject.value).to be_blank
      end
    end
  end
end
