# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#  status                 :string(255)
#  age                    :integer
#  location               :text
#  gender                 :string(255)
#  image                  :text
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  intro                  :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

# Set up original columns from Original User
  attr_accessible :username, :status, :age, :location, :gender, :image, :hate_ids
  has_many :hates

# ImageMagick/paperclip Avatar
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "350x350>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",

        :path => ":rails_root/public/system/:attachment/:id/:style/:filename" ,

        :url => "/system/:attachment/:id/:style/:filename"

#Set up intro string to users
  attr_accessible :intro
  validates_length_of :intro, :maximum => 254,
      :too_long => "{{count}} characters is the maximum allowed"



end
