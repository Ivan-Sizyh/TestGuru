class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || GitHubClient.new
  end

  def call
    @gist = @client.create_gists(gist_params)
  end

  def create?
    @client.get_gist(@gist.id).any?
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
    content = [@question.body]
    content += @question.answers.pluck(:text)
    content.join("\n")
  end
end
