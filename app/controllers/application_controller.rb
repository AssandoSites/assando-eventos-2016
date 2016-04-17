class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Você não tem permissão para acessar essa página"
    redirect_to(request.referrer || root_path)
  end
end
