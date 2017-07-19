class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :red, :green, :teal, :olive
  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end
  helper_method :current_user
end
