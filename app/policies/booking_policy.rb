class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      @bookings = scope.where(user: user)
      # raise
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit
    update?
  end

  def update?
    user_is_owner?
  end

  private

  def user_is_owner?
    user == record.camera.user
  end
end
