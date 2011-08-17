class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
     @title = @user.name
  end
 
  def new
    @user =  User.new
    @title = "Sign Up"
  end
  
  def create
    #raise params[:user].inspect
    @user = User.new (params[:user])
    if @user.save
      #handle success.
      flash[:success] = "welcome to the sample app"
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'
    end
  end

end
