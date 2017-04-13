class AuthenticatedBaseController < ApplicationController
  before_action :require_authentication, :set_totals

  private

  def set_totals
    @distance, @count, @time = Run.totals current_user
  end
end
