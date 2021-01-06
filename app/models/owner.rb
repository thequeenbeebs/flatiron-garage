class Owner < ApplicationRecord
    
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :phone_number, presence: true
    validates :street_address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true
    
    has_many :cars

    def self.search(search)
        if search
            self.where("name LIKE '%#{search}%'")
        else
            self.all.sort_by {|owner| owner.name}
        end
    end

end
