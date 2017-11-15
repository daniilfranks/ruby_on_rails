class Admin::AdminController < ApplicationController  
  before_action :hide_page, :hide_admin_page
  layout 'admin'
end
