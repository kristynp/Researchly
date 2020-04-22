class ResearchGoal < ApplicationRecord
  belongs_to :user
  has_many :resources
  has_many :research_articles
  has_many :journals, through: :resources

  scope :date_created, -> { order(created_at: :desc) }
  scope :most_resources, -> {joins(:resources).group(:id).order('count(resources.id) desc')}

  def resource_count
    self.resources.count 
  end

end
