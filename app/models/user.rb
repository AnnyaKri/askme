class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true

  has_many :questions, dependent: :delete_all

  def downcase_nickname
    nickname.downcase!
  end
end
