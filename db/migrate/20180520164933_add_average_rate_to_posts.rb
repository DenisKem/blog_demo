class AddAverageRateToPosts < ActiveRecord::Migration[5.2]
  def change
    change_table :posts do |t|
      t.integer :average_rate, null: false, default: 0
    end
  end
end
