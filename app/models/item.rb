class Item < ApplicationRecord
  belongs_to :category
  has_many_attached :photo
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :category_id, presence: true
end
