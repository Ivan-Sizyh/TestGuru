class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :results, dependent: :destroy
  has_many :tests, through: :results, inverse_of: 'author'
  has_many :gists, dependent: :destroy

  has_many :badges_users, dependent: :destroy
  has_many :badges, through: :badges_users

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sensitive: false }

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
