class Category < ApplicationRecord
  belongs_to :message
  belongs_to :user
end
