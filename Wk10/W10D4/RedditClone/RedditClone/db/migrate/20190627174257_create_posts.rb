class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, optional: true
      t.string :content, optional: true
      t.integer :sub_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
