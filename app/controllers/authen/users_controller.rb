class Authen::UsersController < Authen::BaseController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Authen::UserMailer.register_email(@user).deliver_now
      # redirect_to new_authen_confirmation_path, olive: 'Please enter your token for comfirmation'
    else
      redirect_to registration_path, red: 'Registration unsucessfull'

    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end
end
