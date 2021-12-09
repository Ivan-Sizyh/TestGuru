class Test < ApplicationRecord
  def self.give_tests_by_category(category)
    Test.joins(:categories).where(title: category).order(title: :desc).pluck(:title)
  end
end
