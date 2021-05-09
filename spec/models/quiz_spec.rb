require 'rails_helper'

RSpec.describe Quiz, type: :model do
  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:quiz)).to be_valid
    end
  end

  describe 'validations' do
    it 'is invalid without a title' do
      expect(build(:quiz, title: nil)).to be_invalid
    end
  end

  describe 'scopes' do
    context 'published' do
      let!(:published_quiz) { create(:quiz) }

      it 'includes a published quiz' do
        expect(Quiz.published).to include(published_quiz)
      end
    end

    context 'unpublished' do
      let!(:unpublished_quiz) { create(:quiz, published: false) }

      it 'excludes an unpublished quiz' do
        expect(Quiz.published).not_to include(unpublished_quiz)
      end
    end
  end
end
