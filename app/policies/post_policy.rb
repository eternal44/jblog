class PostPolicy < ApplicationPolicy

  def update?
    user.present? && user.admin?
  end
  
  # def show? # authorizing show action isn't working.
  #   true    # left it here because it doesn't matter for the blog anyway.
  # end
  
  def create?
    user.present? && user.admin?
  end

  def destroy?
    user.present? && user.admin?
  end

end
