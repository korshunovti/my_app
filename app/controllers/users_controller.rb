class UsersController < ApplicationController
  skip_before_action :require_sign_in, only: %i[ new create ]
  layout :choose_layout

  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_correct_user, only: %i[ show edit update destroy ]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to root_url, notice: t('users.registered')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/1
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    # Смена пароля возможна только при подтверждении текущего
    if changing_password? && !@user.authenticate(params[:user][:current_password].to_s)
      @user.errors.add(:current_password, t('profile.wrong_current'))
      render :edit, status: :unprocessable_entity
      return
    end

    if @user.update(update_params)
      redirect_to @user, notice: t('profile.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
    sign_out
    redirect_to signin_path, notice: t('profile.deleted'), status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Профиль может смотреть и менять только его владелец
  def require_correct_user
    redirect_to root_url, alert: t('profile.forbidden') unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def changing_password?
    params[:user][:password].present?
  end

  # Пустой пароль при редактировании означает «не менять»
  def update_params
    attrs = user_params
    attrs = attrs.except(:password, :password_confirmation) unless changing_password?
    attrs
  end

  def choose_layout
    %w[new create].include?(action_name) ? "auth" : "application"
  end
end