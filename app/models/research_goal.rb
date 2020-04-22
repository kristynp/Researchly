class ResearchGoal < ApplicationRecord
  belongs_to :user
  has_many :resources
  has_many :research_articles
  has_many :journals, through: :resources

  scope :date_created, -> { order(created_at: :desc) }


end
