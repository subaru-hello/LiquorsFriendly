# frozen_string_literal: true

class LiquorPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def new?
    create?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
