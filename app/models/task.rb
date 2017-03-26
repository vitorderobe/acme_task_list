class Task < ApplicationRecord
  belongs_to :list
  validates :list_id, presence: true
  validates :description, presence: true
end
