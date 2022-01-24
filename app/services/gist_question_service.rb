class GistQuestionService
  Result = Struct.new(:url, :success?)

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || GitHubClient.new
  end

  def call
    gist_info = @client.create_gists(gist_params)
    Result.new(gist_info.url, @client.get_gist(gist_info.id).any?)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist.description', test: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:text)].join("\n")
  end
end
