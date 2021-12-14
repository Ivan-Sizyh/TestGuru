class User < ApplicationRecord
  def get_tests_by_level(level)
    Test.joins("JOIN results ON tests.id = results.test_id")
        .where(results: {user_id: id}, tests: {level: level})
  end
end
