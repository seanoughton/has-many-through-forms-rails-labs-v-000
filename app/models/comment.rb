class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(attributes)
    if attributes.include?(:username)
      user = User.find_or_create_by(username: attributes[:username])
      #self.user = user
      binding.pry
      user.comments << self
      #self.save
    else
      user = User.find(attributes[:user_id])
      self.user = user
      self.save
    end
  end

  def user_attributes
    self.user_attributes
  end

end
