class User < ApplicationRecord
  has_secure_password
  before_save :downcase_nickname
  CURRENT_NICKNAME = /\A\w+\z/.freeze
  CURRENT_EMAIL = /\A\w+@\w+\.[a-z]+\z/.freeze

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :nickname, format: { with: CURRENT_NICKNAME}
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: CURRENT_EMAIL}

  has_many :questions, dependent: :destroy

  def downcase_nickname
    nickname.downcase!
  end
end
