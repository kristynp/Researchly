class Resource < ApplicationRecord
  belongs_to :research_goal
  belongs_to :journal

  accepts_nested_attributes_for :journal, reject_if: proc { |attributes| attributes['name'].blank? }

end
