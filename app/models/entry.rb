class Entry < ApplicationRecord

    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :prayers
    has_many :comments, dependent: :destroy
    has_many :hashtags, dependent: :destroy
    validates :content, presence: true
    belongs_to :blog, optional: true

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

    def prayers_count

        count = 0

        self.prayers.each do |prayer|
            if prayer.prayed
                count += 1
            end
        end

        return count
    end
end
