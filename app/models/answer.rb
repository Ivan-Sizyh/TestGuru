class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_limit_answer, on: :create, if: -> { question.present? }

  scope :correct, -> { where(correct: true) }

  private

  def validate_limit_answer
    errors.add(:base, :limit_answers, message: 'The question has the maximum ' +
      'number of answers') if question.answers.size > 4
  end
end
