module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def full_title(page_title = '')
    page_title.empty? ? 'Rcast' : page_title
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def logg_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def hide_page
    redirect_to root_path, alert: 'unauthorized access' unless logged_in?
  end

  def hide_admin_page
    redirect_to root_path, alert: 'unauthorized admin access' unless admin?
  end

  def admin?
    current_user.admin?
  end
end
