class ResourceNote < ApplicationRecord
  belongs_to :resource

  validates :title, presence: true
  validates :content, presence: true

  scope :date_created, -> { order(created_at: :desc) }
end
