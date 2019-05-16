require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validating' do
    before { create(:customer) }
    it { is_expected.to have_many(:transactions) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:store_name) }
    it { is_expected.to validate_presence_of(:identification_document) }
    it { is_expected.to validate_uniqueness_of(:identification_document)
                          .case_insensitive }
  end
end
