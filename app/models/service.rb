class Service < ApplicationRecord
    has_many :service_records
    has_many :cars, through: :service_records
end
