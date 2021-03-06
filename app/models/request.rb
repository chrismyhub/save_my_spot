class Request < ApplicationRecord
    belongs_to :profile
    has_one :vehicle

    validates :location, presence: true
    validates :australian_state, presence: true, length: { maximum: 3 }
    validates :date, presence: true
    validates :time, presence: true
    validates :reward, presence: true
    validates :no_show_penalty, presence: true

    has_one_attached :image
end
