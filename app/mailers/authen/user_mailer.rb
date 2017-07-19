class Authen::UserMailer < ApplicationMailer
  def register_email(user)
    @user = user
    mail(to: user.email)
  end
end
