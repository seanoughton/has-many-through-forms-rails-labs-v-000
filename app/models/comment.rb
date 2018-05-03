class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  accepts_nested_attributes_for :users
=begin
  def user_attributes=(user_attributes)
    binding.pry
    if user_attributes.include?(:username)
      user = User.find_or_create_by(username: attributes[:username])
      user.comments << self
    #else
      #user = User.find(attributes[:user_id])
      #user.comments << self
    end
  end
=end

  def user_attributes
    self.user_attributes
  end

end
