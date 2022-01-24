class GistsController < ApplicationController
  def create
    @result = Result.find_by(params[:id])

    result = GistQuestionService.new(@result.current_question).call

    @result.current_question.gists.create!(url: result.url, user: current_user)

    flash_options = if result.success?
                      { notice: t('.success', link_to: create_gist_link(result))}
                    else
                      { alert: t('.failure')}
                    end

    redirect_to @result, flash_options
  end

  private

  def create_gist_link(result)
    view_context.link_to("Gist", result.url, target: "_blank", rel: "nofollow")
  end
end
