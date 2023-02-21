class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      @bookings = scope.where(user: user)
      # raise
    end
  end
end
