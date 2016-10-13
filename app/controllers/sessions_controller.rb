class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(user_name: params[:session][:user_name].downcase)
        if user && user.authenticate(params[:session][:password])
          log_in user
          redirect_to user
        else
          flash.now[:danger] = 'Invalid user name/password combination'
          render 'new'
        end
   end
 
   def destroy
   end
end
