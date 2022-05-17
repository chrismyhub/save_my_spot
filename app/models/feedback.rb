class Feedback < ApplicationRecord
    belongs_to :user
    belongs_to :profile

    validates :user_id, presence: true
    validates :profile_id, presence: true
    validates :comment, presence: true
    validates :rating, presence: true
end
