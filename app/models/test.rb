class Test < ApplicationRecord
  def self.give_tests_by_category(category)
    category_id = Category.where(title: category).pluck(:id)
    self.class.order(id: :desc).where(category: category_id).pluck(:title)
  end
end
