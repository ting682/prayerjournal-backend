class Hashtag < ApplicationRecord
  belongs_to :blog, optional: true
  belongs_to :entry, optional: true
  belongs_to :comment, optional: true
end
