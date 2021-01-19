class Blog < ApplicationRecord

    belongs_to :user
    has_many :entries, dependent: :destroy
    has_many :hashtags, dependent: :destroy

    def name
        return self.user.name
    end
end
