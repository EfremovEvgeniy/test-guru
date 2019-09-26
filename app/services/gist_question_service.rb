class GistQuestionService
  # require 'dotenv/load'

  attr_reader :response

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @response = @client.create_gist(gist_params)
  end

  def success?
    @response[:html_url].present?
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
      public: true,
      files: { 'test-guru-question.txt' => {
        content: gist_content
      } }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
