class Question < ApplicationRecord
  belongs_to :user

    validates :body, presence: true, length: { minimum: 3, maximum: 280 }

  def hidden?
    @question = Question.find(id)
    @question.hidden
  end
end
