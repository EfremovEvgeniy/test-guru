class GitHubClient
  require 'dotenv/load'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Content-Type'] = 'application/json'
      reauest.body = params.to_json
    end
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
