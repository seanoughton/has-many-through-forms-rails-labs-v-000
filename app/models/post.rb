class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  #accepts_nested_attributes_for :categories

  def categories_attributes=(attribute)
    self.categories << Category.find_or_create_by(name: attribute[:"0"][:name])
  end

  def categories_attributes
    self.category
  end





  def unique_users
    self.users.uniq
  end


end
