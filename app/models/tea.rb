class Tea < ActiveRecord::Base
	has_one :product

	enum teatype: [ :Крупнолистовой, :Среднелистовой, :Мелколистовой ]
end
