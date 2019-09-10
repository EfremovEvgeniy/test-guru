class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      redirect_to tests_path
      session[:user_id] = user.id
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password!'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
