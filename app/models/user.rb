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
#

class User < ApplicationRecord
end
