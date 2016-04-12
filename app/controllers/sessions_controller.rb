class SessionsController < ApplicationController
  layout "login", only: [:new, :create]
 def new
 
 end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "You logged"
    else
      flash[:error] = "Invalid email or password brow"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_url, :notice => "Logot"
  end
end
