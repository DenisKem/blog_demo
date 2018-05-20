class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :post_id, index: true, null: false
      t.foreign_key :posts
      t.integer :value, null: false
      t.timestamps
    end
  end
end
