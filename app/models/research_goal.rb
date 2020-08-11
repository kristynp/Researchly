class ResearchGoal < ApplicationRecord
  belongs_to :user
  has_many :resources
  has_many :journals, through: :resources
  has_many :research_goal_notes

  validates :name, presence: true
  validates :description, presence: true

  scope :date_created, -> { order(created_at: :desc) }

  def resource_count
    self.resources.count 
  end

end
