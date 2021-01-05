class Car < ApplicationRecord
    
    validates :year, presence: true
    validates_length_of :year, :minimum => 4
    validates_length_of :year, :maximum => 4
    validates :make, presence: true
    validates :model, presence: true
    
    belongs_to :owner
    has_many :service_records
    has_many :services, through: :service_records
end
