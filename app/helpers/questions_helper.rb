module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "Создание нового вопроса в #{@test.title}"
    else
      "Редактирование вопроса #{question.test.title}"
    end
  end
end
