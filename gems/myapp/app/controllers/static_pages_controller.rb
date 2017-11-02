class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  # GET /static_pages
  def index
  end

  # GET /info
  def info
    #authorize @static_pages
  end

  protected

  def user_not_authorized
    redirect_to root_path, alert: 'You are not allowed to do that.'
  end
end
