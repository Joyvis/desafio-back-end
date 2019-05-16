require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  describe 'validating' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:direction) }
    it { is_expected.to validate_presence_of(:type_external_id) }
    it { is_expected.to validate_uniqueness_of(:type_external_id)
                          .case_insensitive }
  end
end
