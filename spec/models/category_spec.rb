require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:category)).to be_valid
    end
  end

  describe 'validations' do
    it 'is invalid without a name' do
      expect(build(:category, name: nil)).to be_invalid
    end
  end
end
