class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, inverse_of: 'author'

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
