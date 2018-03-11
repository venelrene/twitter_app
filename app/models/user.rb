# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string
#  image              :string
#  description        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  provider           :string
#  location           :string
#  nickname           :string
#  uid                :string
#  token              :string
#  secret             :string
#  friends_count      :integer
#  followers_count    :integer
#  statuses_count     :integer
#  profile_image_url  :string
#  profile_banner_url :string
#

class User < ApplicationRecord
  has_many :tweets


  def self.find_or_create_from_auth_hash(auth_hash)

    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
        name: auth_hash.info.name,
        nickname: auth_hash.info.nickname,
        image: auth_hash.info.image,
        location: auth_hash.info.location,
        description: auth_hash.info.description,
        token: auth_hash.credentials.token,
        secret: auth_hash.credentials.secret,
        followers_count: auth_hash.extra.raw_info.followers_count,
        friends_count: auth_hash.extra.raw_info.friends_count,
        statuses_count: auth_hash.extra.raw_info.statuses_count,
        profile_image_url: auth_hash.extra.raw_info.profile_image_url,
        profile_banner_url: auth_hash.extra.raw_info.profile_banner_url
        )
    user
  end

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.twitter_api_key
      config.consumer_secret     = Figaro.env.twitter_api_secret
      config.access_token        = token
      config.access_token_secret = secret
    end
  end


  # Fetch the timeline of Tweets by a user
  def user_tweets(user_id)
    twitter.user_timeline(user_id)
  end

  # Fetch the timeline of Tweets from the authenticated user's home page
  def timeline
    twitter.home_timeline
  end


end
