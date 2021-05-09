require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end

  describe 'validations' do
    it 'is invalid without an email' do
      expect(build(:user, email: nil)).to be_invalid
    end

    it 'is invalid without a password' do
      expect(build(:user, password: nil)).to be_invalid
    end
  end
end
