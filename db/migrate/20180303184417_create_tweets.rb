class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
