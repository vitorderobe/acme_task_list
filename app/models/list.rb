class List < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true
  has_many :favorites, dependent: :destroy
  has_many :followers, through: :favorites, source: :user
end
