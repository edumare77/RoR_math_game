module ArithmeticsHelper
  
  def subtraction_score
    Result.joins(:arithmetic).where(arithmetics: { user_id: current_user.id }).pluck(:'subtraction').sum
      end
      
  def addition_score
      Result.joins(:arithmetic).where(arithmetics: { user_id: current_user.id }).pluck(:'addition').sum
        end
        
  def multiplication_score
      Result.joins(:arithmetic).where(arithmetics: { user_id: current_user.id }).pluck(:'multiplication').sum
        end
        
  def total_score
    subtraction_score + addition_score + multiplication_score
        end
  #@result_sub = Result.joins(:arithmetic).where(arithmetics: { user_id: current_user.id }).pluck(:'subtraction').sum
     # @result_add = Result.joins(:arithmetic).where(arithmetics: { user_id: current_user.id }).pluck(:'addition').sum  
     # @result_mult = Result.joins(:arithmetic).where(arithmetics: { user_id: current_user.id }).pluck(:'multiplication').sum
      #@total_score = @result_sub +  @result_add + @result_mult
  
end
