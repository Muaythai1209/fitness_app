class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authenticate_current_user!

  private

  def authenticate_current_user!
    redirect_to sign_out_path unless current_user.present?
  end

  def current_user
    @current_user ||= AdminUser.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_flipper?
    Flipper.enabled?(:login_by_sso)
  end
end
