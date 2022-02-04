class Badge < ApplicationRecord
  enum events: { all_tests_level: 0, first_try: 1, all_tests_category: 2 }
  URL_PATTERN = /[http.s]?:\/\/(\S+)/.freeze

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :image, presence: true,
                    format: { with: URL_PATTERN }
  validates :event, presence: true
  validates :criterion, presence: true
end
