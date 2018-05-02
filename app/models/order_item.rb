class OrderItem < ApplicationRecord
	validates :order_id, presence: true
	validates :product_id, presence: true
	validates :quantity, numericality: {greater_than: 0}
	belongs_to :order
	belongs_to :product
	def subtotal
        quantity.to_i * product.price
    end
end
