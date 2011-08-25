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
      #handle success
    end
   end
  
  def destroy
  end
  

end
