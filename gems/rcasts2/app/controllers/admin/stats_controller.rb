class Admin::StatsController < ApplicationController
  def index
    @post_count = Post.count
    @users_count = User.count
    @last_post = Post.last
    @from_today = Post.from_today
  end
end