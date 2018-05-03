class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(attributes)
    if attributes.include?(:username)
      user = User.find_or_create_by(username: attributes[:username])
      user.comments << self
    else
      user = User.find(attributes[:user_id])
      user.comments << self
    end
  end

end
