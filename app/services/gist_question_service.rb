class GistQuestionService
  GITHUB_ACCESS_TOKEN = Rails.application.credentials.github[:github_access_token]

  Result = Struct.new(:url, :success?)

  def initialize(question, client: default_client)
    @question = question
    @test = question.test
    @client = client
  end

  def call
    gist_info = @client.create_gist(gist_params)
    Result.new(gist_info.url, @client.last_response.status == 201)
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

  def default_client
    Octokit::Client.new(access_token: GITHUB_ACCESS_TOKEN)
  end
end
