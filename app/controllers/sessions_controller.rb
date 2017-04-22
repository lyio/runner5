class SessionsController < ApplicationController

  def new
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def create
      value = params[:value].to_s
      user = User.find_user_by(value)

      if !user
        redirect_to '/login', notice: "Uh oh, We could not find the username. Please try again."
      else
        user.send_login_link "#{request.protocol}#{request.host_with_port}"
        redirect_to root_path, notice: "We have sent you the link to login to our app."
      end
  end

  def auth
    token = params[:token].to_s
    user_id = params[:user_id]
    user = User.find_by(id: user_id)

    if !user || !user.valid_token?(token)
      redirect_to root_path, notice: "It seems the token is not valid. Try requesting a new login link"
    else
      sign_in_user(user)
      redirect_to root_path, notice: "You have been logged in!"
    end
  end
end
