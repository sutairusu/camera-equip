class EquipmentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!

    def resolve
      # scope
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
end
