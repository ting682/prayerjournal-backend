class Blog < ApplicationRecord

    belongs_to :user
    has_many :entries
    has_many :hashtags
end
