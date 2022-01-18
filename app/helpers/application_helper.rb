module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'nofollow'
  end

  def flash_message(type)
    if flash[type]
      content_tag :p, flash[type], class: "flash #{type}"
    end
  end
end
