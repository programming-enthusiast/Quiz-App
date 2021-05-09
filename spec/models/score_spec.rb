require 'rails_helper'

RSpec.describe Score, type: :model do
  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:score)).to be_valid
    end
  end

  describe 'validations' do
    it 'is invalid without a user' do
      expect(build(:score, user_id: nil)).to be_invalid
    end

    it 'is invalid without a user' do
      expect(build(:score, quiz_id: nil)).to be_invalid
    end
  end
end
