class SessionsController < ApplicationController
  skip_before_action :require_sign_in
  layout "auth"

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].to_s.downcase)

    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_url, notice: 'Вход выполнен'
    else
      flash.now[:alert] = 'Неверный email или пароль'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: 'Вы вышли из системы'
  end
end