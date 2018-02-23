# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string
#  image       :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  provider    :string
#  location    :string
#  nickname    :string
#  uid         :string
#  token       :string
#  secret      :string
#

class User < ApplicationRecord
  has_many :tweets


  def self.find_or_create_from_auth_hash(auth_hash)

    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update name: auth_hash.info.nickname,
                image: auth_hash.info.image,
                location: auth_hash.info.location,
                description: auth_hash.info.description,
                token: auth_hash.credentials.token,
                secret: auth_hash.credentials.secret
    user
  end

end
