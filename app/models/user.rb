class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: %i[facebook google_oauth2]
#postがuserに依存して、もしユーザーがデーターベースから削除されたらユーザーが投稿した全ての投稿も削除される→dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  validates :name, length: { maximum: 8 }
  validates :profile, length: { maximum: 50 }
  validates :spot, length: { maximum:50 }
  validates :favorite, length: { maximum: 50 }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
