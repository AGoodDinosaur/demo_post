class UserMailer < ApplicationMailer
  def sign_up(user)
    mail to: user.email,
    subject: "Dang ky!"
  end

  def send_reset_password(user, token)
    @token = token
    mail to: user.email,
    subject: "Confirm!"
  end
end