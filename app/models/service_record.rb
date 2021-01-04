class ServiceRecord < ApplicationRecord
    has_many :parts
    belongs_to :mechanic
    belongs_to :service
    belongs_to :car
end
