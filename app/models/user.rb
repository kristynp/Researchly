class User < ApplicationRecord
  has_many :research_goals
  has_many :resources, through: :research_goals
  has_secure_password 

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence:true
  validates :password, { :length => { :in => 6..20 } }
end
