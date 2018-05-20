class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :author_id, index: true, null: false
      t.foreign_key :users, column: :author_id
      t.text :content, null: false
      t.string :author_ip, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end
