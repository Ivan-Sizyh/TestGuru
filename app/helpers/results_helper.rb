module ResultsHelper
  def calculate_result_percent(result)
    ((result.correct_questions.to_f / result.test.questions.count) * 100).round(2)
  end
end
