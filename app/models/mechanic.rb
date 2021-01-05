class Mechanic < ApplicationRecord
    
    validates :name, presence: true
    validates :years_experience, presence: true
    validates :hire_date, presence: true
    validates :hourly_price, presence: true

    
    has_many :service_records
end
