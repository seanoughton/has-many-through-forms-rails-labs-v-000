class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(attributes)
    binding.pry
    if attributes.include?(:user_name)
      @user = User.create(username: attributes[:username])
      @user.comments << @comment
    end
    #self.user = User.find(attributes[:user_id])
  end
  #accepts_nested_attributes_for :post
  #accepts_nested_attributes_for :user
end
