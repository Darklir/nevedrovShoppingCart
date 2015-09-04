class AddCoffeToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :coffe, index: true, foreign_key: true
    add_reference :products, :tea, index: true, foreign_key: true
  end
end
