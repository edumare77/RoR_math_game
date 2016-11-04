class User < ApplicationRecord
  has_many :arithmetic, dependent: :destroy
  #has_many :result, dependent: :destroy
  VALID_LEV = %w(Beginner Intermediary Proficiency)
  VALID_CAT = %w(Student Teacher)
  
  after_initialize :set_defaults
      # The set_defaults will only work if the object is new
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :surname, presence: true, length: { maximum: 50 }
  validates :level, presence: true
  validates_inclusion_of :level, :in => VALID_LEV
  validates :user_name, presence: true, length: { maximum: 50 },
                       uniqueness: true 
  validates :categorie, presence: true  
  validates_inclusion_of :categorie, :in => VALID_CAT                  
  validates :score, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 },
                       confirmation: true, on: :create
  validates :password, allow_nil: true, confirmation: true,
                       length: { minimum: 6 },
                       on: :update
    
  # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  
    def set_defaults
      self.level  ||= 'Beginner'
      self.score  ||= 0
      self.categorie  ||= 'Student'
    end
  
end
