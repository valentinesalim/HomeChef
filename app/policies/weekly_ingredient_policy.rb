class WeeklyIngredientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
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
    update?
  end

  def update?
    owner_of?
  end

  def destroy?
    owner_of?
  end

  private
  def owner_of?
    record.user == user
  end
end
