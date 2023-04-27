class User < ApplicationRecord
  FORMAT_NICKNAME = /\A\w+\z/.freeze

  has_secure_password
  has_many :questions, dependent: :destroy

  before_validation :downcase_nickname

  validates :name, presence: true
  validates :nickname, presence: true,
            uniqueness: true,
            length: { maximum: 40 },
            format: { with: FORMAT_NICKNAME }
  validates :email, presence: true,
            uniqueness: true,
            email: true

  def downcase_nickname
    nickname.downcase!
  end
end
