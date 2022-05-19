class Profile < ApplicationRecord
    belongs_to :user
    has_many :feedbacks, dependent: :destroy
    has_many :requests, dependent: :destroy
    has_many :vehicles, dependent: :destroy
    
    validates :name, presence: true
    validates :phone_number, presence: true, length: { maximum: 10 }
    validates :australian_state, presence: true, length: { maximum: 3 }
    validates :user_id, presence: true
end
