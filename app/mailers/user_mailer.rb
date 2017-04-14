class UserMailer < ApplicationMailer

  def login_link(user, url)
    @user = user
    @auth_link = "#{url}/auth/#{user.id}/#{user.login_token}"
    
    mail(to: @user.email, subject: "Your login link to runner5")
  end
end
