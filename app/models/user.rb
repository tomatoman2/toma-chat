class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :messages
  has_many :comments
  validates :name, presence: true, uniqueness: true
  # validates :user_id, {presence: true}
  # def user
  #   return User.find_by(id: self.user_id)
  # end
end
