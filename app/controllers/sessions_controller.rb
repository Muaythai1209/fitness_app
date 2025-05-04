class SessionsController < ApplicationController
  skip_before_action :authenticate_current_user!, only: [:new, :create, :destroy]
  protect_from_forgery except: :create

  def new; end

  def create
    admin = AdminUser.from_google(**from_google_params)

    if admin.present?
      login_admin_user(admin)
    else
      flash[:alert] = I18n.t('login.alert_info', email: auth.info.email)
      redirect_to login_path
    end
  end

  def failure
    redirect_to admin_root_path, alert: I18n.t('login.error')
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: I18n.t('login.sign_out_info')
  end

  private

  def login_admin_user(admin)
    is_active = admin.active?

    session[:user_id] = admin.id
    flash[:success] = is_active ? I18n.t('login.success') : I18n.t('login.success_with_inactive_user')
    redirect_to is_active ? after_sign_in_path : login_path
  end

  def after_sign_in_path
    path = session[:return_to]
    session[:return_to] = nil

    path.presence || admin_users_path
  end

  def from_google_params
    { uid: auth.uid, email: auth.info.email, full_name: auth.info.name }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
