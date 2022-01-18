require 'digest/sha1'

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, inverse_of: 'author'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
