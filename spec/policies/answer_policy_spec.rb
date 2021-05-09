require 'rails_helper'

describe AnswerPolicy do
  subject { described_class }

  permissions :show?, :create?, :new?, :update?, :edit?, :destroy? do
    let(:user) { build(:user) }
    let(:answer) { build(:answer) }
    let(:quiz_user) { answer.question.quiz.user }

    it 'denies access if users mismatch' do
      expect(subject).not_to permit(user, answer)
    end

    it 'grants access if users match' do
      expect(subject).to permit(quiz_user, answer)
    end
  end
end
