class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday, presence: true
  validates :first_name_kana, :last_name_kana, format: { with: /\A[\p{katakana}ー]+\z/, message: "はカタカナで入力してください" }
  validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龠々]+\z/, message: "は漢字、ひらがな、カタカナのみを含めてください" }
end
