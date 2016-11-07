class UsersController < ApplicationController
  
  def show
      @user = User.find(params[:id])
  end
     
  def new
    @user = User.new
  end
  
  def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the Math Game!"
        redirect_to @user
      else
        render 'new'
      end
  end
  
  def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to root_path
    end
  
  private
    
    def user_params
        params.require(:user).permit(:name, :surname, :user_name, :password,
                                     :password_confirmation)
    end
end
