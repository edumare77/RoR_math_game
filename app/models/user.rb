class User < ApplicationRecord
  VALID_CAT = %w(Beginner Intermediary Proficiency)
  
  after_initialize :set_defaults
      # The set_defaults will only work if the object is new
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  validates :level, presence: true
  validates_inclusion_of :level, :in => VALID_CAT
  validates :user_name, presence: true, length: { maximum: 50 },
                       uniqueness: true 
  validates :categorie, presence: true                     
  validates :score, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
    
  
  
    def set_defaults
      self.level  ||= 'Beginner'
      self.score  ||= 0
      self.categorie  ||= 'Student'
    end
  
end
