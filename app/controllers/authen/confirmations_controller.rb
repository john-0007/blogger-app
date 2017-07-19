class Authen::ConfirmationsController < Authen::BaseController
  def new
    if params[:token].present?
      confirm_and_redirect(params[:token])
    end
  end

  def create
    confirm_and_redirect(params[:token])
  end
  private

  def confirm_and_redirect(token)
    @user =User.where(confirmation_token: token).first
    @user.confirmed_at = DateTime.now
    if @user.save
      session[:user_id]=@user.id
      redirect_to root_path
    end
  end
end
