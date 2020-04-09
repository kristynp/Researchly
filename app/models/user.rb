class User < ApplicationRecord
  has_many :research_goals
  has_many :resources, through: :research_goals
end
