module ApplicationHelper
  def is_admin?
    current_user.is_a?(Admin)
  end
end
