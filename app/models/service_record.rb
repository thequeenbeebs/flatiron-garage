class ServiceRecord < ApplicationRecord
    
    validates :date_of_service, presence: true
    validates :labor_hours, presence: true
    validates_length_of :note, :maximum => 250
    
    has_many :parts
    belongs_to :mechanic
    belongs_to :service
    belongs_to :car

    def total_cost
        parts = 0
        self.parts.each do |part|
            parts += part.price
        end
        labor = self.labor_hours * self.mechanic.hourly_price
        parts + labor
    end
end
