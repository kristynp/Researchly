class Resource < ApplicationRecord
  belongs_to :research_goal
  belongs_to :journal

  validates :title, presence: true
  validates :research_goal_id, presence: true


  def journal_attributes=(journal_attributes)
    self.journal = Journal.where(:name => journal_attributes[:name]).first_or_create do |t|
      t.name = journal_attributes[:name]
      t.website = journal_attributes[:website]
      t.open_source = journal_attributes[:open_source]
    end
  end

end
