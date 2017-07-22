class Admin::BaseController < ApplicationController
  before_action :ensure_admin_user!

  def ensure_admin_user!
    unless current_user && current_user.admin?
      redirect_to root_path, red: 'you are not admin user'
    end
  end
end
