class Feedback < ApplicationRecord
    belongs_to :profile
    validates :profile_id, presence: true
    validates :comments, presence: true
    validates :rating, presence: true
end
