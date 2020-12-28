class User < ApplicationRecord

    has_one_attached :avatar
    has_many :entries
    has_secure_password
    validates :email_address, presence: true, uniqueness: true
    validates :name, presence: true
    validates :bio, presence: true
end
