class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  SUCCESS_RATIO = 85

  def completed?
    self.current_question.nil?
  end

  def successful?
    calculate_result_percent >= SUCCESS_RATIO
  end

  def calculate_result_percent
    ((self.correct_questions.to_f / self.test.questions.count) * 100).round(2)
  end

  def calculate_result_progress
    (self.current_question_number - 1) * 100 / self.test.questions.count
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.status = successful?

    save!
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).size
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort ==  answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.new_record?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
