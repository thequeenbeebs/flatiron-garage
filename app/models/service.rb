class Service < ApplicationRecord

    validates :service_description, presence: true
    validates :labor_estimate, presence: true


    has_many :service_records
    has_many :cars, through: :service_records
end
