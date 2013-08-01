# == Schema Information
#
# Table name: hates
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  category   :string(255)
#  post       :text
#  hate_rate  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hate < ActiveRecord::Base
  attr_accessible :category , :post, :hate_rate, :user_id
  belongs_to :user
  has_many :ratings, :dependent => :destroy


  # ImageMagick/paperclip Avatar
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",

        :path => ":rails_root/public/system/:attachment/:id/:style/:filename" ,

        :url => "/system/:attachment/:id/:style/:filename"

  validates :category, :presence => true
  validates :post, :presence => true
  validates :hate_rate, :presence => true

  attr_accessible :post
  validates_length_of :post, :maximum => 254,
      :too_long => "{{count}} characters is the maximum allowed"

# self.top_hates(num)
# all.order('cat desc').limit(num or 20)
# end
end
