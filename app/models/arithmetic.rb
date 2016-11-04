class Arithmetic < ApplicationRecord
  after_create do
          Result.create arithmetic: self
        end
  belongs_to :user
  has_one :result, dependent: :destroy
  default_scope  { order(created_at: :desc) }
  
  
end
