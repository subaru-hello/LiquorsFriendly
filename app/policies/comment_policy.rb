# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
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
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
