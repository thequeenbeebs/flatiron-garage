class Service < ApplicationRecord

    validates :service_description, presence: true
    validates :labor_estimate, presence: true
    validates :labor_estimate, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


    has_many :service_records
    has_many :cars, through: :service_records
end
