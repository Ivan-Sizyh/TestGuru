class User < ApplicationRecord
  def get_tests_by_level(level)
    Test.joins(:results).where(level: level)
  end
end
