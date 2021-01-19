class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :entry
    has_many :hashtags, dependent: :destroy

    def name
        return self.user.name
    end
end
