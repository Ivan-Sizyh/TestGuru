class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_and_belongs_to_many :badges

  has_many :results, dependent: :destroy
  has_many :tests, through: :results, inverse_of: 'author'
  has_many :gists, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sensitive: false }

  def tests_by_level(level)
    tests.where(level: level).order(:id)
  end

  def successful_tests_by_level(level)
    tests.joins(:results)
         .where(tests: { level: level }, results: { status: true })
         .order(:id)
         .uniq
  end

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end

  def results_by_test(test)
    results.order(id: :desc).where(test_id: test.id)
  end

  def results_by_category(category)
    tests.joins(:results)
         .where(tests: { category: category }, results: { status: true })
         .order(title: :desc)
         .pluck(:title)
         .uniq
  end

  def successful_results
    tests.joins(:results)
         .where(results: { status: true })
         .order(:id)
         .uniq
  end
end
