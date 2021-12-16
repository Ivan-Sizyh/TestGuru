class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users, inverse_of: 'author'
  has_many :results

  def get_tests_by_level(level)
    Test.joins("JOIN results ON tests.id = results.test_id")
        .where(results: {user_id: id}, tests: {level: level})
  end
end
