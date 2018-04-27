class Beach < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :information, presence: true, length: { maximum: 300 }
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  mount_uploader :image, ImageUploader
  paginates_per 10
  geocoded_by :name
  after_validation :geocode, if: :name_changed?
end
