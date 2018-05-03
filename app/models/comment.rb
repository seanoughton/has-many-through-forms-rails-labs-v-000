class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(attributes)
    self.user = User.find(attributes[:user_id])
  end
  #accepts_nested_attributes_for :post
  #accepts_nested_attributes_for :user
end
