class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_lists, through: :favorites, source: :list
  scope :all_except, -> (user) { where.not(id: user) }

	# Favorite a list.
	def favorite(list)
	  favorite_lists << list
	end

  # Disfavor a list.
  def unfollow(list)
    favorite_lists.delete(list)
  end

  # Returns true if the current user is favorites the list.
  def favorite?(list)
    favorite_lists.include?(list)
  end
end
