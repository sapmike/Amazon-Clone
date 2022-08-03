class User < ApplicationRecord
  has_secure_password
  has_many :orders, dependent: :destroy #destroying associated records when parent is removed (delete account button)

  validates :email, uniqueness: true, presence: true

  validates_presence_of :first_name,
                      :last_name,
                      :password_digest

end
