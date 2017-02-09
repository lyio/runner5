class UserMailer < ApplicationMailer

  def login_link(user)
    @user = user
    @auth_link = "http://localhost:3000/auth/#{user.id}/#{user.login_token}"

    mail(to: @user.email, subject: "Your login link to runner5")
  end
end
