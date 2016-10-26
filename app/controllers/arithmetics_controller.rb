class ArithmeticsController < ApplicationController

    
  def new
    user = User.find_by(user_name: current_user.user_name)
    render 'new'
  end
  
  
  def initialize
      @sub1 = rand(1...101) 
      @sub2 = rand(1...@sub1)
      @add1 = rand(1..101)
      @add2 = rand(1..101)
      @mult1 = rand(1...13)
      @mult2 = rand(1...13)
        
    end
    
   
    
    def create
      sub = params[:sub]
      #print "this is the user subtraction #{sub}" 
      add = params[:add]
      #print "this is the user addition #{add}" 
      mult = params[:mult]
      #print "this is the user multiplication #{mult}" 
      sub_res = params[:subtraction]
      add_res = params[:addition]
      mult_res = params[:multiplication]
      user_score= 0
      user ||= current_user
        
      if sub == sub_res
        user_score += 1
      end 
      
      if add == add_res
        user_score += 1
      end 
      
      if mult == mult_res
        user_score += 1
      end 
      
      user_score += user.score
      
      user.update_attribute(:score, user_score)
      user.save!
      if user.save
     
      flash[:success] = "Well done, let's play again!"
      redirect_to game_path
      else
          # print the errors to the development log
          Rails.logger.info(user.errors.messages.inspect)
          render 'new'
        end

      
    end
    

end
