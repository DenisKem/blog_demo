class CreateAuthorIps < ActiveRecord::Migration[5.2]
  def change
    create_table :author_ips do |t|
      t.string :ip, null: false
      t.string :logins, null: false, array: true, default: []
      t.integer :logins_count, null: false, default: 0

      t.timestamps
    end
  end
end
