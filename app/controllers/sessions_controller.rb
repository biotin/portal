class SessionsController < ApplicationController
 skip_before_filter :authorize
  def create
      user = User.authenticate(params[:name], params[:password])
    if user 
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: "Logged out"
  end

end
