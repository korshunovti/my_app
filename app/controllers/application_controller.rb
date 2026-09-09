class ApplicationController < ActionController::Base
  include SessionsHelper

  around_action :switch_locale
  before_action :require_sign_in

  private

  def require_sign_in
    return if signed_in?

    redirect_to signin_path, alert: t('sessions.please_sign_in')
  end

  def switch_locale(&action)
    locale = params[:locale] || session[:locale] || I18n.default_locale
    locale = I18n.default_locale unless I18n.available_locales.map(&:to_s).include?(locale.to_s)
    session[:locale] = locale
    I18n.with_locale(locale, &action)
  end
end