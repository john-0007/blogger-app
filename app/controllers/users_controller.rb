class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.resgister_email(@user).deliver_now
      redirect_to new_confirmation_path, olive: 'Please enter your token for comfirmation'
    else
      redirect_to singin_path, red: 'Registration unsucessfull'

    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                 :password_confirmation)
  end
end
