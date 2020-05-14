class Message < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
