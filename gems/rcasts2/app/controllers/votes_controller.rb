class VotesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @article.votes.create(user: current_user)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
end
