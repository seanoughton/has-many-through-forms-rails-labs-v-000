class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(attributes)
    if attributes.include?(:username)
      self.user = User.create(username: attributes[:username])
      self.user.comments << @comment
    end
    #self.user = User.find(attributes[:user_id])
  end
  #accepts_nested_attributes_for :post
  #accepts_nested_attributes_for :user
end
