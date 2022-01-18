class SessionsController < ApplicationController
  def new
    log_out
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:return_path) || tests_path
    else
      flash.now[:alert] = 'Подтвердите вашу электронную почту и пароль.'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
