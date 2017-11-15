class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.password == params[:session][:password]
      logg_in(user)
      redirect_to user, notice: 'Session was successfully created.'
    else
      flash[:alert] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: 'You are logged out.'
  end
end
