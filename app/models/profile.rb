class Profile < ApplicationRecord
    belongs_to :user
    
    validates :name, presence: true
    validates :phone_number, presence: true, length: { maximum: 10 }
    validates :australian_state, presence: true, length: { maximum: 3 }
    validates :user_id, presence: true

    has_many :feedbacks, dependent: :destroy
    has_many :requests
    
end
