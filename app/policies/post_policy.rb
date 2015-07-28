class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    user.role == "Admin"
  end
  
  # def show? # authorizing show action isn't working.
  #   true    # left it here because it doesn't matter for the blog anyway.
  # end
  
  def create?
    user.role == "Admin"
  end

end
