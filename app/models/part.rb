class Part < ApplicationRecord
    
    validates :number, presence: true
    validates :description, presence: true
    validates_length_of :description, :maximum => 50
    validates :price, presence: true
    
    belongs_to :service_record
end
