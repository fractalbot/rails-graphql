class PostPolicy < ApplicationPolicy

  def get_posts?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
