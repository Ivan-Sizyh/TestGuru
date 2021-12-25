module QuestionsHelper
  def question_header
    case params[:action]
    when 'new'
      "Создание нового вопроса в #{@question.test.title}"
    when 'edit'
      "Редактирование вопроса #{@question.test.title}"
    end
  end
end
