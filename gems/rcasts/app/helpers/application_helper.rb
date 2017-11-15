module ApplicationHelper
  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
