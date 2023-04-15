class Question < ApplicationRecord

  def hidden?
    @question = Question.find(id)
    @question.hidden
  end
end
