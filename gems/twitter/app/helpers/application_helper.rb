module ApplicationHelper
  def full_title(page_title = '')
    page_title.empty? ? 'Twitter' : "#{page_title} | Twitter"
  end

  def bootstrap_class_for(flash_type)
    { success: 'alert-success',
      danger: 'alert-danger',
      warning: 'alert-warning',
      notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def gravatar_for(user, size: 90)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar', size: size)
  end
end
