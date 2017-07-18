class SessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first
    if @user.confirmed? & @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, green: 'successfully sing in'
    else
      flash[:error] =
        redirect_to login_path, red: 'invaid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, teal: 'successfully singout'
  end
end
