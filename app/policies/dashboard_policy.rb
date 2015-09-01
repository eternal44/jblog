class DashboardPolicy
  def overview?
    user.present? && user.admin?
  end
end
