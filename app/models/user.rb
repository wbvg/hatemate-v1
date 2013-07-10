class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

# Set up original columns from Original User
  attr_accessible :username, :status, :age, :location, :gender, :image

# ImageMagick/paperclip Avatar
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",

        :path => ":rails_root/public/system/:attachment/:id/:style/:filename" ,

        :url => "/system/:attachment/:id/:style/:filename"

  # ,   :path => ":rails_root/public/system/:attachment/:id/:style/:filename"


###### NEED TO RESOLVE AVATAR call Images######

   # has_attached_file :avatar,
   #    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
   #    :url => "/system/:attachment/:id/:style/:filename"

# Country Select
 def country_name
    ::CountrySelect::COUNTRIES[country_code]
  end

end
