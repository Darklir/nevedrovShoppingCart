class Coffe < ActiveRecord::Base
	has_one :product

	enum coffetype: [ :Моносорт, :Смесь ]
end
