class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    owner_of?
  end

  def update?
    true
  end

  def destroy?
    true
  end

  private
  def owner_of? #if the user is owner of that book
    record == user
  end
end
