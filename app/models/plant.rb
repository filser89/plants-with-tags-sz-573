class Plant < ApplicationRecord
  belongs_to :garden
  has_many :plant_tags, dependent: :destroy # Plant.first.plant_tags
  has_many :tags, through: :plant_tags  # Plant.first.tags





  validates :name, :image_url, presence: true
end
