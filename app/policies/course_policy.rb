class CoursePolicy < ApplicationPolicy
  class Scope < Scope
  end

  def create?
    user_is_owner?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def edit?
    user_is_owner?
  end

  def new?
    user_is_owner?
  end

  def user_is_owner?
    record.establishment.user == user or user.adming
  end
end
