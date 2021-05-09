class AnswerPolicy < ApplicationPolicy
  def show?
    quiz_user
  end

  def create?
    quiz_user
  end

  def new?
    quiz_user
  end

  def update?
    quiz_user
  end

  def edit?
    quiz_user
  end

  def destroy?
    quiz_user
  end

  private

  def quiz_user
    user == record.question.quiz.user
  end
end
