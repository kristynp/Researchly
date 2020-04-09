class ResearchGoal < ApplicationRecord
  belongs_to :user
  has_many :research_articles 
  has_many :journals, through: :resources
end
