class Mechanic < ApplicationRecord
    
    validates :name, presence: true
    validates :years_experience, presence: true
    validates :years_experience, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :hire_date, presence: true
    validates :hourly_price, presence: true

    
    has_many :service_records
end