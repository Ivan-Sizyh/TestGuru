class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  case_sensitive: false }
  validates :level, presence: true,
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  validates :time, presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def self.tests_by_category_titles(category_title)
    Test.joins(:category)
        .where(categories: { title: category_title })
        .order(title: :desc)
        .pluck(:title)
  end
end
