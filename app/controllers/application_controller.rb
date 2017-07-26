class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
  def require_authentication
    authenticate_user!
  end
end
