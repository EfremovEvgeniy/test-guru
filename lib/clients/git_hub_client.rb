class GitHubClient
  ACCESS_TOKEN = '45d3353aa724631140275eb4c8b63913c2cac97a'.freeze

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
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
