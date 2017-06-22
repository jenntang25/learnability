class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
     return true
   end

   def update?
    user_is_owner?
  end

end
end
