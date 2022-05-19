class Vehicle < ApplicationRecord
    belongs_to :profile, dependent: :destroy
    has_many :requests

    validates :type, presence: true
    validates :color, presence: true, length: { maximum: 3 }
    validates :license_plate, presence: true
    validates :make, presence: true
    validates :year, presence: true, length: { maximum: 4 }
    validates :comments
end
