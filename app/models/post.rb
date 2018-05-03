class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  #accepts_nested_attributes_for :comments

  accepts_nested_attributes_for :categories

  def categories_attributes=(attribute)
    binding.pry
    self.category = Category.find_or_create_by(name: attribute[:"0"][:name])
    self.category.update(attribute)
  end

  def categories_attributes
    self.category
  end

  #accepts_nested_attributes_for :users



  def unique_users
    self.users.uniq
  end


end
