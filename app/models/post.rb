class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :comments

  def comment_content=(comment_content)
    binding.pry
  end

  def comment_content
    self.content
  end
end
