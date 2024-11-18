class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [ :username ]
  enum :role, %i[admin student instructor]
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
end
