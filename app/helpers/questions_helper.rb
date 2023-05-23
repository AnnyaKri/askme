module QuestionsHelper
  def current_author(question)
    if question.author == current_user
      "вы"
    else
      "@#{question.author.nickname}"
    end
  end
end
