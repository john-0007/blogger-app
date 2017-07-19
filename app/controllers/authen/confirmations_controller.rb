class Authen::ConfirmationsController < Authen::BaseController
  def new
    confirm_and_redirect(params[:token]) if params[:token].present?
  end

  private

  def confirm_and_redirect(token)
    user = User.where(confirmation_token: token).first
    if session[:user_id].present?
      redirect_to root_path, olive: 'your already singed in!'
    elsif user && user.confirmed?
      redirect_to singin_path, teal: 'you alredy confirmed please singin'
    elsif user && !user.confirmed?
      user.confirmed_at = DateTime.now
      session[:user_id] = user.id
      redirect_to root_path, green: 'Thank you for confirmming your email'
    else
      redirect_to singin_path, red: 'Invaild token'

    end
  end
end
