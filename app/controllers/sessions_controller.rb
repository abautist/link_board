class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate login_params['email'], login_params['password']

  	if user
  		session[:user_id] = user.id
  		flash[:success] = "#{user.email} logged in!"
  		redirect_to root_path
  	else
  		flash[:danger] = "Credentials invalid!"
  		redirect_to login_path
  	end
  end

  def destroy
  end

  private

  def login_params
  	params.require(:user).permit(:email, :password)
  end
end
