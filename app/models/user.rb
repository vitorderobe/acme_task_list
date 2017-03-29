class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_lists, through: :favorites, source: :list

  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 90 }
  validates :password, presence: true, length: { minimum: 6 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  scope :all_except, -> (user) { where.not(id: user) }

	# Favorite a list.
	def favorite(list)
	  favorite_lists << list
	end

  # Disfavor(unfollow) a list.
  def unfollow(list)
    favorite_lists.delete(list)
  end

  # Returns true if the current user is favorites the list.
  def favorite?(list)
    favorite_lists.include?(list)
  end
end
