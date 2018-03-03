class AddFollowerUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :friends_count, :integer
    add_column :users, :followers_count, :integer
    add_column :users, :statuses_count, :integer
    add_column :users, :profile_image_url, :string
    add_column :users, :profile_banner_url, :string
  end
end
