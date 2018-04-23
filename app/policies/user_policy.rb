class UserPolicy < ApplicationPolicy

  def all_users?
    user.user? || user.admin?
  end

  def user?
    user.user? || user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
