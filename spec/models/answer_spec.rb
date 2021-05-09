require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:answer)).to be_valid
    end
  end

  describe 'validations' do
    it 'is invalid without a text' do
      expect(build(:answer, text: nil)).to be_invalid
    end
  end
end
