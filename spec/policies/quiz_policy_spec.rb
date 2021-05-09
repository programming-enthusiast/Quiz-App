require 'rails_helper'

describe QuizPolicy do
  subject { described_class }

  permissions :show?, :update?, :edit?, :destroy? do
    let(:user) { build(:user) }
    let(:quiz) { build(:quiz) }

    it 'denies access if users mismatch' do
      expect(subject).not_to permit(user, quiz)
    end

    it 'grants access if users match' do
      expect(subject).to permit(user, build(:quiz, user: user))
    end
  end
end
