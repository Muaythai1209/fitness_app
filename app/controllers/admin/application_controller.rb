# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    helper_method :current_user
    before_action :authenticate_current_user!

    load_and_authorize_resource

    rescue_from CanCan::AccessDenied do |err|
      error_render_method(err)
    end

    private

    def error_render_method(err)
      flash[:error] = err.message

      redirect_to admin_users_path
    end

    def authenticate_current_user!
      redirect_to sign_out_path unless current_user.present?
    end

    def current_user
      @current_user ||= AdminUser.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
end
