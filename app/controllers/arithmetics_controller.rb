class ArithmeticsController < ApplicationController
  
  def new
    user_param = current_user
    user=User.new(params[user_param])
  end
  
 
  
  def initialize
      @sub1 = rand(1...101) 
      @sub2 = rand(1...@sub1)
      @add1 = rand(1..101)
      @add2 = rand(1..101)
      @mult1 = rand(1...13)
      @mult2 = rand(1...13)
        
    end
    
    # accessor methods
    def sub1
          @sub1
       end
    
    def sub2
          @sub2
    end
  
    def add1
        @add1
    end
  
    def add2
        @add2
    end
  
   def mult1
        @mult1
    end
  
    def mult2 
        @mult2 
    end
    
    # setter methods
    def setSub1
      @sub1 = rand(11)
    end
    
    def setSub2
      @sub2 = rand(sub1)+1 || rand(11)
      
    end
    
    def setAdd1
      @add1 = rand(11)
    end
      
    def setAdd2
      @add2 = rand(11)
      
    end
    
    def setMult1
      @mult1 = rand(13)
      
    end
      
    def setMult2
      @mult2 = rand(13)
    end
    
    
    
    def subtraction
      @sub1 - @sub2
    end
    
    def addition
      @add1 + @add2
    end
    
    def multiplication
     @mult1 * @mult2
    end
    
    def result
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
       
      user_param = current_user
      user=User.new(params[user_param])
         
      if sub == sub_res
        user_score += 1
      end 
      
      if add == add_res
        user_score += 1
      end 
      
      if mult == mult_res
        user_score += 1
      end 
      
     
print "this is the user score #{user_score}" 
user.update_attribute(:score, user_score)

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
