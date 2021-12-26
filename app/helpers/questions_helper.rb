module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Создание нового вопроса в #{question.test.title}"
    elsif question.persisted?
      "Редактирование вопроса #{question.test.title}"
    end
  end
end
