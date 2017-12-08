module ApplicationHelper
  def full_title(page_title = '')
    page_title.empty? ? 'Store' : "#{page_title} | Store"
  end

  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      danger: 'alert-danger',
      warning: 'alert-warning',
      notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end
end
