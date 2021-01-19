class User < ApplicationRecord

    has_one_attached :avatar
    has_many :entries, dependent: :destroy
    has_many :blogs, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :prayers
    has_secure_password
    validates :email_address, presence: true, uniqueness: true
    validates :name, presence: true
    validates :bio, presence: true
end
