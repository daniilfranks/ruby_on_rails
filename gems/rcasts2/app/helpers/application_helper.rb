module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !@current_user.nil?
  end

  def hide_page
    redirect_to root_path unless logged_in?
  end
end
