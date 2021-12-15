class Test < ApplicationRecord
  # belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :results
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.give_tests_by_category(category_title)
    Test.joins("JOIN categories ON tests.category_id = categories.id")
        .where(categories: {title: category_title})
        .order(title: :desc)
        .pluck(:title)
  end
end
