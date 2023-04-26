class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :nickname, format: { with: /\A[\w]+\z/ }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :email, format: { with: /\A[\w]+@[\w]+\.[a-z]+\z/ }

  has_many :questions, dependent: :destroy

  def downcase_nickname
    nickname.downcase!
  end
end
