class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :email, presence: true #, uniqueness: true
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+{6,}\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字を含めて設定してください' 
        # validates :password, presence: true, length: { minimum: 6 }
         validates :password, confirmation: true
         validates :password_confirmation, presence: true
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
          validates :first_name
          validates :second_name
        end
         #validates :first_name, presence: true
         #validates :second_name, presence: true
         with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カナ文字を使用してください' } do
          validates :first_name_kana
          validates :second_name_kana
         end
         #validates :first_name_kana, presence: true
         #validates :second_name_kana, presence: true
         validates :birthday, presence: true

         has_many :items ,foreign_key: :user_id , dependent: :destroy
         has_many :orders ,foreign_key: :user_id, dependent: :destroy

end
