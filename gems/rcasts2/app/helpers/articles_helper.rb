module ArticlesHelper
  def article_rang(article)
    (0..3).include?(article) ? 'Geralt' : 'Divine'
  end
end
