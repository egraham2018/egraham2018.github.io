class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy
	belongs_to :buyer, class_name: "User"
	belongs_to :seller, class_name: "User"
	def total
        t=0
        order_items.each do |item|
            t+=item.subtotal
        end
        t
    end
end
