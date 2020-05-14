class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_messages, through: :likes, source: :message
  #ユーザーが投稿に対して既にいいねしているか
  def already_liked?(message)
    likes.exists?(message_id: message.id)
  end
  validates :name, presence: true, uniqueness: true
  mount_uploader :image, ImageUploader
end
