class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_limit_answer, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_limit_answer
    if question.present? && question.answers.count >= 4
      errors.add(:base, :limit_answers, message: 'The question has the maximum number of answers')
    end
  end
end
