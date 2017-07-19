class Authen::ConfirmationsController < Authen::BaseController
  def new; end

  def create
    @user = User.where(confirmation_token: params[:token]).first
    @user.confirmed_at = DateTime.now
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, green: 'Welcome to the blogger app'
    end
  end
end
