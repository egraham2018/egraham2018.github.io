module ProductsHelper
	def in_stock(stock)
        if stock >= 1
            true
        elsif stock <= 0
            false
        end
    end
end
