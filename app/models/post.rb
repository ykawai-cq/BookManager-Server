class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :purchase_date, presence: true
end