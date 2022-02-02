class Badge < ApplicationRecord
  EVENTS = %w[all_tests? all_tests_level? first_try? all_tests_category?]
  URL_PATTERN = /[http.s]?:\/\/(\S+)/

  has_and_belongs_to_many :users

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :image, presence: true,
                    format: { with: URL_PATTERN }
  validates :event, presence: true
end
