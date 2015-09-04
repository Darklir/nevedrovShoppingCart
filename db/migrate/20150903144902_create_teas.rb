class CreateTeas < ActiveRecord::Migration
  def change
    create_table :teas do |t|
      t.integer :teatype, default: 0

      t.timestamps null: false
    end
  end
end
