class User < ApplicationRecord
  def get_tests_by_level(level)
    Test.joins("JOIN results ON tests.id = results.test_id AND results.user_id = ?", id).where(level: level)
  end
end
