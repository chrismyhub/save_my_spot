class Vehicle < ApplicationRecord
    belongs_to :profile
    has_many :requests

    # validates :vehicle_type, presence: true
    # validates :color, presence: true, length: { maximum: 3 }
    # validates :license_plate, presence: true
    # validates :make, presence: true
    # validates :year, presence: true, length: { maximum: 4 }
end
