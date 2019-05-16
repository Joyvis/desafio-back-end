require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validanting' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to belong_to(:transaction_type) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:card_number) }
    it { is_expected.to validate_presence_of(:transaction_date) }
    it { is_expected.to validate_presence_of(:customer_id) }
    it { is_expected.to validate_presence_of(:transaction_type_id) }
  end
end
