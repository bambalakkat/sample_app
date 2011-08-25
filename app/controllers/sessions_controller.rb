class SessionsController < ApplicationController
  def new
    @title = "Sign In"
   end

  def create
    @title = "Sign In"
    email = params[:session][:email]
    pwd = params[:session][:password]
    user = User.authenticate(email, pwd)
    if user.nil?
    
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
   
    else
      sign_in user
      redirect_to user
    end
   end
  
  def destroy
    
    sign_out
    redirect_to root_path
  end
  

end
