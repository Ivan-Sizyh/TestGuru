class User < ApplicationRecord
  def get_tests_by_level(level)
    tests = Result.where(user: self.id).pluck(:test_id)
    Test.where(id: tests, level: level)
  end
end
