class Journal < ApplicationRecord
  has_many :resources
  has_many :research_goals, through: :resources

  validates :name, presence: true
  validates :website, presence: true
  validates :website, url: true
end
