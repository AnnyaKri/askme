class Hashtag < ApplicationRecord
  HASHTAG_FORMAT = /#[[:word:]-]+/.freeze

  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  before_validation :downcase_body

  scope :with_questions, -> { where_exists(:hashtag_questions) }

  validates :body, presence: true

  private

  def downcase_body
    body&.downcase!
  end
end
