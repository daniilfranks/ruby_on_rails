class AdminController < ApplicationController
  layout 'admin'
  
  def index; end

  def users
    @users = User.all
  end
end