class UserMailer < ApplicationMailer
  def resgister_email(user)
    @user = user
    mail(to: user.email)
  end
end
