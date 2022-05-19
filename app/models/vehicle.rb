class Vehicle < ApplicationRecord
    belongs_to :profile, dependent: :destroy
    has_many :requests
end
