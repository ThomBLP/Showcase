class Category < ApplicationRecord
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
