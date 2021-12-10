class Test < ApplicationRecord
  def self.give_tests_by_category(category)
    Test.joins("JOIN categories ON tests.category_id = categories.id AND categories.title = ?", category)
        .record(title: :desc).pluck(:title)
  end
end
