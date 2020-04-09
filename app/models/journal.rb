class Journal < ApplicationRecord
  has_many :resources 
  has_many :research_goals, through: :resources 
end
