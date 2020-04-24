class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :most_resources, -> {joins(:resources).group(:id).order('count(resources.id) desc')}

end
