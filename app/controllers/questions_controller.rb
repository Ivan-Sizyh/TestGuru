class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.all

    render plain: questions.map { |question| question.inspect }.join("\n")
  end

  def show
    render plain: @question.inspect
  end

  def new
  end

  def create
    question = @test.questions.build(question_params)

    render plain: question.inspect if question.save
  end

  def destroy
    render plain: 'Тест успешно удален' if @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    head 404
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
