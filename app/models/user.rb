class User < ApplicationRecord
  VALID_CAT = %w(Beginner Intermediary Proficiency)
  validates :name, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  validates :level, presence: true
  validates_inclusion_of :level, :in => VALID_CAT
  validates :user_name, presence: true, length: { maximum: 50 },
                       uniqueness: true 
  validates :score, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
end
