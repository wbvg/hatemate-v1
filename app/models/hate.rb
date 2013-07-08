# == Schema Information
#
# Table name: hates
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  category   :string(255)
#  post       :text
#  hate_rate  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hate < ActiveRecord::Base
  attr_accessible :user_id, :category, :post, :hate_rate
  belongs_to :user
  has_many :ratings
end
