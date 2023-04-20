class Question < ApplicationRecord
  belongs_to :user
  def hidden?
    @question = Question.find(id)
    @question.hidden
  end
end
