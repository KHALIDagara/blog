class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_one_attached :featured_image do |attachable| 
    attachable.variant :medium, resize_to_limit: [800,400]
    attachable.variant :thumb, resize_to_limit: [400,200]
  end
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  scope :tagged_with, ->(tag_name) {joins(:tags).where(tags: { name: tag_name})}

  validates :title, presence: true
  validates :content, presence: true


end
