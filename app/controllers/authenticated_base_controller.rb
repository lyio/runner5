class AuthenticatedBaseController < ApplicationController
  before_action :require_authentication
end
