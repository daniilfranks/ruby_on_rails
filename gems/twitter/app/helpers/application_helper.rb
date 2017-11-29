module ApplicationHelper
  def full_title(page_title = '')
    page_title.empty? ? 'Twitter' : "#{page_title} | Twitter"
  end
end
