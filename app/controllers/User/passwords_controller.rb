# frozen_string_literal: true

class User::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create
    # super
    #  Minh can lam:
    token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    @user = User.find_by(email: params[:user][:email])
    @user.update(reset_password_token: token)
    UserMailer.send_reset_password(@user, token).deliver_now
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    # super
    @user = User.find_by(reset_password_token: params[:reset_password_token])
  end

  # PUT /resource/password
  def update
    # super
    @user = User.find_by(reset_password_token: params[:user][:reset_password_token])
    @user.update(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])

  end

  protected

  def after_resetting_password_path_for(resource)
    redirect_to new_user_session_path
  end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
