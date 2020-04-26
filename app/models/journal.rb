class Journal < ApplicationRecord
  has_many :resources
  has_many :research_goals, through: :resources

  validates :name, presence: true
  validates :website, presence: true
  validates :website, url: true

  def open_source?
    if self.open_source == true 
      'Yes'
    elsif self.open_source == false 
      'No' 
    else
      'Unknown'
    end
  end
end
