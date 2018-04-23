class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  before_save { email.downcase! }
  has_secure_password # パスワードのハッシュ化（登録フォームの作成)
  validates :password, presence: true, length: { minimum: 6 }
  has_many :beaches, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_beaches, through: :likes, source: :beach
end
