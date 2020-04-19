class SessionsController < ApplicationController 

  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(user_name: params[:user][:user_name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Incorrect login info. Please try again."
      redirect_to "/login"
    end
  end

  def omnilogin
    #find_or_create a user using the attributes in auth
    @user = User.find_or_create_by(:email)
    binding.pry
  end

  def auth
    request.env['omniauth.auth'] 
  end
  
end 