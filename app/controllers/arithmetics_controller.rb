class ArithmeticsController < ApplicationController
  
    
  def new
    user = User.find_by(user_name: current_user.user_name)
    @arithmetic = current_user.arithmetic.new
    @result_sub = Result.joins(:arithmetic).where(arithmetics: { user_id: current_user.id }).pluck(:'subtraction').sum
    @result_add = Result.joins(:arithmetic).where(arithmetics: { user_id: current_user.id }).pluck(:'addition').sum  
    @result_mult = Result.joins(:arithmetic).where(arithmetics: { user_id: current_user.id }).pluck(:'multiplication').sum
    @total_score = @result_sub +  @result_add + @result_mult
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
               @arithmetic = current_user.arithmetic.create
               result=@arithmetic.result
              
               user_sub=  result.subtraction
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
                  end 
               
               
              result.update_attributes(:subtraction => user_sub, :addition => user_add, :multiplication => user_mult)
               
               p "esto sale"
               if @arithmetic.save
                 redirect_to new_arithmetic_path
               else
                  redirect_to new_arithmetic_path
               end
      
      
    end
    
  def destroy
    end
  
    
    

end
