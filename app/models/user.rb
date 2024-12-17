class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [ :username ]
  enum :role, %i[admin student instructor]
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :saved_posts
  has_many :saved_posts_records, through: :saved_posts, source: :post
  has_one :user_cred
  def approved?
    return false if self.user_cred.nil?
    self.user_cred.approved
  end
end
