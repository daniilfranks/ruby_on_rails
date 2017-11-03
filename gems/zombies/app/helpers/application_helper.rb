module ApplicationHelper
  def secret_name
    @secret_name ||= User.find(session[:secret_id])
  end
end
