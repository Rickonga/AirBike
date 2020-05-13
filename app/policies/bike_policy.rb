class BikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
    # OR ?? user == record.user || user.admin?
  end

  def show?
    true
  end

  def update?
    user_owns_record? || user_is_admin?
  end

  def destroy?
    user_owns_record? || user_is_admin?
  end

  private

  def user_owns_record?
    record.user == user
  end

  def user_is_admin?
    user.nil? ? false : user.admin?
  end
end
