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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
