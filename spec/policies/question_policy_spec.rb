require 'rails_helper'

describe QuestionPolicy do
  subject { described_class }

  permissions :show?, :create?, :new?, :update?, :edit?, :destroy? do
    let(:user) { build(:user) }
    let(:question) { build(:question) }
    let(:quiz_user) { question.quiz.user }

    it 'denies access if users mismatch' do
      expect(subject).not_to permit(user, question)
    end

    it 'grants access if users match' do
      expect(subject).to permit(quiz_user, question)
    end
  end
end
