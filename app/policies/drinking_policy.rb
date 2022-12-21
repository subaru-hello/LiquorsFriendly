# frozen_string_literal: true

class DrinkingPolicy < ApplicationPolicy
  def show
    record.user_id == user.id
  end

  def update?
    record.user_id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    record.user_id == user.id
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
