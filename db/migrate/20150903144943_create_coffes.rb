class CreateCoffes < ActiveRecord::Migration
  def change
    create_table :coffes do |t|
      t.integer :coffetype, default: 0

      t.timestamps null: false
    end
  end
end
