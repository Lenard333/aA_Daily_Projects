class CreateShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, index: true
      t.string :long_url
      t.integer :user_id
      
      t.timestamps
    end
  end
end
