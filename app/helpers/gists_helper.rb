module GistsHelper
  def short_question(question)
    question.truncate(25)
  end

  def gist_hash(gist_url)
    gist_url.split('/').last
  end
end
