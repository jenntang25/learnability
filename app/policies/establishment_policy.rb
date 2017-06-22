class EstablishmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      #scope.where(user: user)
    end

    def create?
      user_is_owner?
    end

    def update?
      user_is_owner?
    end

    def destroy?
      user_is_owner?
    end


  end
end
