class Entry < ApplicationRecord

    belongs_to :user
    has_many :likes
    has_many :comments
    validates :content, presence: true

    def name
        return self.user.name
    end

    def likes_count

        count = 0

        self.likes.each do |like|
            if like.liked
                count += 1
            end
        end

        return count
    end
end
