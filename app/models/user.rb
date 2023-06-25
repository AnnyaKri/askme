class User < ApplicationRecord
  include Gravtastic

  NICKNAME_FORMAT = /\A\w+\z/.freeze
  COLOR_FORMAT = /\A#\h{3}{1,2}\z/.freeze
  DEFAULT_NAVBAR_COLOR = "#370617".freeze

  has_many :questions, dependent: :destroy

  before_validation :downcase_nickname

  validates :name, presence: true
  validates :nickname, presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: NICKNAME_FORMAT }
  validates :email, presence: true,
            uniqueness: true,
            email: true
  validates :navbar_color, format: { with: COLOR_FORMAT }, presence: true

  gravtastic(secure: true, filetype: :png, size: 100, default: "retro")

  has_secure_password

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
