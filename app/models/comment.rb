class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :entry

    def name
        return self.user.name
    end
end
