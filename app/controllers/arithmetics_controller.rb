class ArithmeticsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
    
  def new
    user = User.find_by(user_name: current_user.user_name)
    @arithmetic = current_user.arithmetic.new
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
               add = params[:add]
               mult = params[:mult]
               sub_res = params[:subtraction]
               add_res = params[:addition]
               mult_res = params[:multiplication]
               p "the total is #{mult}"
              # user = User.find_by(user_name: current_user.user_name)
              @arithmetic = current_user.arithmetic.create
              result=@arithmetic.result
              p "resulr id is #{@arithmetic.result}"
               user_sub=  result.subtraction
              p "subtraction is #{sub_res}"
               user_add=  result.addition
               user_mult= result.multiplication
                 
               if sub == sub_res
                 user_sub += 1
               end 
               
               if add == add_res
                 user_add += 1
               end 
               
               if mult == mult_res
                 user_mult += 1
                 p "multiplication is #{user_mult}"
               end 
               
               
              result.update_attributes(:subtraction => user_sub, :addition => user_add, :multiplication => user_mult)
                     @arithmetic.save!
                     result.save!
                     if @arithmetic.save
                       p "user_id is #{@arithmetic.user_id}"
                      
                      
                    
                     flash[:success] = "Well done, let's play again!"
                     redirect_to new_arithmetic_path
                     else
                         # print the errors to the development log
                         Rails.logger.info(user.errors.messages.inspect)
                       redirect_to new_arithmetic_path
                       end
      
      
    end
    
  def destroy
    end
  
    
    

end
