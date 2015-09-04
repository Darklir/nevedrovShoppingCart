class Product < ActiveRecord::Base
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	belongs_to :tea 
	belongs_to :coffe

	private

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			return false
		end
	end
end
