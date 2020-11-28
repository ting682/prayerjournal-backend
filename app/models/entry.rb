class Entry < ApplicationRecord

    belongs_to :user
    has_many :likes
    has_many :comments

    def name
        return self.user.name
    end

    def likes_count
        return self.likes.size
    end
end
