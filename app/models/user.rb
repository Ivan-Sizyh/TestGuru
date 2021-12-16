class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, inverse_of: 'author'

  def get_tests_by_level(level)
    tests.where(level: level)
  end
end
