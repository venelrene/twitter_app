class AddProviderToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :provider, :string
    add_column :users, :location, :string
    add_column :users, :nickname, :string
    add_column :users, :uid, :string
    add_column :users, :token, :string
    add_column :users, :secret, :string
  end
end
