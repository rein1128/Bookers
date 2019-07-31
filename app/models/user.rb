class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { in: 2..20 }
  # validates :password, confirmation: true
  validates :introduction, length: { maximum: 50 }

    has_many :books

    attachment :profile_image
end
