class Hashtag < ApplicationRecord
  HASHTAG_FORMAT = /#[[:word:]-]+/.freeze

  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  before_validation :downcase_body

  validates :body, presence: true

  scope :with_questions, -> { where_exists(:hashtag_questions) }

  private

  def downcase_body
    body&.downcase!
  end
end
