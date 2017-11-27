class ModeratorController < ApplicationController
  layout 'moderator'
  
  def index; end

  def users
    @users = User.all
  end
end