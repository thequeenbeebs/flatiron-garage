class Car < ApplicationRecord
    belongs_to :owner
    has_many :service_records
    has_many :services, through: :service_records
end
