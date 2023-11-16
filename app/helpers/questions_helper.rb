module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? 'create' : 'edit'
    t("activerecord.attributes.question.#{action}_question") + " #{test_title(question)}"
  end

  private

  def test_title(question)
    question.test.title
  end
end
