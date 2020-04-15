class Message < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  # def self.search(search)
  #   return Message.all unless search
  #   Message.where('text LIKE(?)', "%#{search}%")    
  # end
end
