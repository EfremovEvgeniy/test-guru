module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def github_author(author)
    link_to author, "https://github.com/#{author}", target: '_blank'
  end
end
