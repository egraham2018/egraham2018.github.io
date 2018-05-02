class Product < ApplicationRecord
	has_many :order_items
	mount_uploader :image, ImageUploader
	validates :price, numericality: { greater_than: 0 }
	validates :name, :category, :price, :stock, :image, presence: true
end
