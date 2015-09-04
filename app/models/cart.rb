class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		current_item = line_items.find_by_product_id(product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end

	def delete_product(product_id)
		current_item = line_items.find_by_product_id(product_id)
		if current_item 
			if current_item.quantity > 1
				current_item.quantity -= 1
			end
		end
		current_item
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price } - amount_of_discount
	end

	def discount_for_tea
		discount_for_tea = 0
		count_discount_tea = 0

		line_items.each do |item| 
			if item.product.tea and item.product.tea.teatype == "Крупнолистовой" 
				count_discount_tea += item.quantity
			end
		end

		if count_discount_tea >= 3
			discount_for_tea = 20
		end
		discount_for_tea 
	end

	def discount_for_coffee
		discount_for_coffee = 1

		line_items.each do |item| 
			if item.product.coffe and item.product.coffe.coffetype == "Моносорт" and item.product.title == "Эфиопия Харрар" and item.quantity >= 2
				discount_for_coffee = 0.5
			end
		end
		discount_for_coffee
	end

	def amount_of_discount
		discount = 0
		if discount_for_coffee != 1
			discount += line_items.to_a.sum { |item| item.total_price } * discount_for_coffee
		end
		discount += discount_for_tea
	end

end

