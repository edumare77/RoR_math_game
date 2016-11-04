class ResultsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  def new
    #user = User.find_by(user_name: current_user.user_name)
   # arithmetic=Arithmetic.find_by(user_id: current_user.user_id)
       # @result = current_user.result.new 
      #@result = results.new
        
  end
  
  def create
        
    #@result = Result.new(result_params)
          sub = params[:sub]
          add = params[:add]
          mult = params[:mult]
          sub_res = params[:subtraction]
          add_res = params[:addition]
          mult_res = params[:multiplication]
          p "the total is #{mult}"
         # user = User.find_by(user_name: current_user.user_name)
         @result = current_user.arithmetic.result.build(result_params)
          user_sub=  @result.subtraction
         p "subtraction is #{sub_res}"
          user_add=  @result.addition
          user_mult= @result.multiplication
            
          if sub == :subtraction
            user_sub += 1
          end 
          
          if add == :addition
            user_add += 1
          end 
          
          if mult == :multiplication
            user_mult += 1
            p "multiplication is #{user_mult}"
          end 
          
          
         @result.update_attributes(:subtraction => user_sub, :addition => user_add, :multiplication => user_mult)
                @result.save!
                if @result.save
                  p "user_id is #{@result.user_id}"
                 
                  p "subtraction is #{@result.subtraction}"
               
                flash[:success] = "Well done, let's play again!"
                redirect_to new_arithmetic_path
                else
                    # print the errors to the development log
                    Rails.logger.info(user.errors.messages.inspect)
                  redirect_to new_arithmetic_path
                  end
        
      end
      
  private
      
      def result_params
          params.require(:result).permit(:arithmetic_id)
      end
end
