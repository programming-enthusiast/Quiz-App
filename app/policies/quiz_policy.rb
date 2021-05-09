class QuizPolicy < ApplicationPolicy
  def show?
    record_user
  end

  def update?
    record_user
  end

  def edit?
    record_user
  end

  def destroy?
    record_user
  end

  private

  def record_user
    user == record.user
  end
end
