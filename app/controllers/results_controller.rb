class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show update score]

  def show
  end

  def score
  end

  def update
    @result.accept!(params[:answer_ids])

    if @result.completed?
      BadgesService.new(@result).call
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
end
