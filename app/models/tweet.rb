# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ApplicationRecord

  belongs_to :user, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 280 }
  before_create :post_to_twitter

  def post_to_twitter
    user.twitter.update(content)
  end

end
