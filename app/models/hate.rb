# == Schema Information
#
# Table name: hates
#
#  id         :integer          not null, primary key
#  category   :string(255)
#  post       :text
#  hate_rate  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hate < ActiveRecord::Base
  attr_accessible :category, :post, :hate_rate
  has_and_belongs_to_many :users
  has_many :ratings

  # ImageMagick/paperclip Avatar
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",

        :path => ":rails_root/public/system/:attachment/:id/:style/:filename" ,

        :url => "/system/:attachment/:id/:style/:filename"

end
