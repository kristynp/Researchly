class ResearchGoalNotes < ApplicationRecord
  belongs_to :research_goal

  validates :title, presence: true
  validates :content, presence: true

  scope :date_created, -> { order(created_at: :desc) }

end