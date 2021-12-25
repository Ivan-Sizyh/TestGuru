class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy edit]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    redirect_to @test
  end

  def destroy
    @question.destroy
  end

  def show
  end

  def edit
    @test = @question.test
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def new
    @question = @test.questions.build
  end

  def create
    question = @test.questions.build(question_params)

    if question.save
      redirect_to @test
    else
      :new
    end
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
