# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  hate_id    :integer
#  user_id    :integer
#  hate_up    :integer
#  hate_down  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Rating < ActiveRecord::Base
  attr_accessible :hate_id, :user_id, :hate_up, :hate_down
  belongs_to :hate

  def self.total_count
    where(:hate_up => 1).count - where(:hate_down => 1).total_count
  end
end


