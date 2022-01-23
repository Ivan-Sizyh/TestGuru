class GitHubClient
  ACCESS_TOKEN = Rails.application.credentials.github[:token]

  def initialize
    @http_client = setup_http_client
  end

  def create_gists(params)
    @http_client.create_gist(params)
  end

  def get_gist(gist_id)
    @http_client.gist(gist_id)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
