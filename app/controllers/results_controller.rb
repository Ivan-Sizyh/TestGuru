class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show update score gist]

  def show
  end

  def score
  end

  def gist
    service = GistQuestionService.new(@result.current_question)
    result = service.call

    @result.current_question.gists.create(url: result.url, user: current_user)

    flash_options = if service.create?
                      { notice: t('.success', link_to: create_gist_link(result))}
                    else
                      { alert: t('.failure')}
                    end

    redirect_to @result, flash_options
  end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      TestsMailer.completed_test(@result).deliver_now
      redirect_to score_result_path(@result)
    else
      render :show
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def create_gist_link(result)
    view_context.link_to("Gist", result.url, target: "_blank", rel: "nofollow")
  end
end
