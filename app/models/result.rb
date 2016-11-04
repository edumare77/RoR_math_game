class Result < ApplicationRecord
  #belongs_to :user
  belongs_to :arithmetic
  
  after_initialize :set_defaults
         # The set_defaults will only work if the object is new
    
   # validates :user_id, presence: true
  validates :arithmetic_id, presence: true
    validates :subtraction, presence: true
    validates :addition, presence: true
    validates :multiplication, presence: true
    
    
    def set_defaults
          self.subtraction  ||= 0
          self.addition  ||= 0
          self.multiplication  ||= 0
        end
end
