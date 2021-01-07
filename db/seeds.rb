# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Car.destroy_all
Owner.destroy_all
ServiceRecord.destroy_all
Service.destroy_all
Mechanic.destroy_all
Part.destroy_all


ownr1 = Owner.create(name: "George Winston", email: "gwinston@gwinston.com", street_address: "123 Stone Place", city: "Baltimore", state: "MD", zip_code: 21201, phone_number: "123-456-7890")
ownr2 = Owner.create(name: "Lyle Lovett", email: "llovett@llovett.com", street_address: "345 Blades Avenue", city: "Ellicott City", state: "MD", zip_code: 21401, phone_number: "713-867-5309")
ownr3 = Owner.create(name: "Eddie Murphy", email: "emurphy@emurphy.com", street_address: "1343 Elligant Place", city: "Laurel", state: "MD", zip_code: 20707, phone_number: "713-972-1964")
ownr4 = Owner.create(name: "Dolly Parton", email: "dparton@dparton.com", street_address: "402 Falls Road", city: "Baltimore", state: "MD", zip_code: 21211, phone_number: "281-546-3249")
ownr5 = Owner.create(name: "Scott Voorhees", email: "svoorhees@svoorhees.com", street_address: "5123 Mayo Road", city: "Edgewater", state: "MD", zip_code: 21037, phone_number: "281-630-8839")

car1 = Car.create(year: 2018, make: "Chevrolet", model: "Suburban", owner_id: ownr1.id, in_garage: true)
car2 = Car.create(year: 1979, make: "Ford", model: "Pinto", owner_id: ownr2.id, in_garage: true)
car3 = Car.create(year: 2020, make: "Ferrari", model: "Portofino", owner_id: ownr3.id, in_garage: true)
car4 = Car.create(year: 2019, make: "Cadillac", model: "XT4", owner_id: ownr4.id)
car5 = Car.create(year: 2016, make: "Hyundai", model: "Veloster", owner_id: ownr5.id)
car6 = Car.create(year: 1999, make: "Ford", model: "F150", owner_id: ownr1.id)
car7 = Car.create(year: 2016, make: "Lincoln", model: "Navigator", owner_id: ownr3.id)

mech1 = Mechanic.create(name: "Jim", years_experience: 2, hire_date: "2020-10-08", hourly_price: 18)
mech2 = Mechanic.create(name: "John", years_experience: 5, hire_date: "2015-02-25", hourly_price: 25)
mech3 = Mechanic.create(name: "Robert", years_experience: 10, hire_date: "2000-05-20", hourly_price: 35)
mech4 = Mechanic.create(name: "Billy", years_experience: 1, hire_date: "2020-01-10", hourly_price: 13)
mech5 = Mechanic.create(name: "Nash", years_experience: 5, hire_date: "2015-01-08", hourly_price: 19)

srv1 = Service.create(service_description: "Brake Pad Replacement",labor_estimate: 2)
srv2 = Service.create(service_description: "New Tire Install(4)",labor_estimate: 3)
srv3 = Service.create(service_description: "Change Transmission Fluid",labor_estimate: 1)
srv4 = Service.create(service_description: "Replace Transmission Filter",labor_estimate: 1)
srv5 = Service.create(service_description: "Replace Windshield",labor_estimate: 2)
srv6 = Service.create(service_description: "Replace Broken Taillight",labor_estimate: 1)
srv7 = Service.create(service_description: "New Radiator",labor_estimate: 4)
srv8 = Service.create(service_description: "Replace Air Conditioning Compressor",labor_estimate: 2)
srv9 = Service.create(service_description: "Change Spark Plugs(6)",labor_estimate: 1)
srv10 = Service.create(service_description: "Brake Rotor Replacement(2)",labor_estimate: 2)

srvrcd1 = ServiceRecord.create(car_id: car1.id, service_id: srv6.id, mechanic_id: mech4.id, date_of_service: "2020-10-02", labor_hours: 2, note: "Trouble removing old taillight")
part1 = Part.create(service_record_id: srvrcd1.id, number: 678594, description: "Taillight", price: 50)
srvrcd2 = ServiceRecord.create(car_id: car3.id, service_id: srv10.id, mechanic_id: mech2.id, date_of_service: "2020-05-02", labor_hours: 3, note: "Frozen rotor on left side")
part2 = Part.create(service_record_id: srvrcd2.id, number: 238740, description: "Brake Rotor", price: 75)
srvrcd3 = ServiceRecord.create(car_id: car2.id, service_id: srv3.id, mechanic_id: mech1.id, date_of_service: "2019-11-02", labor_hours: 1, note: "Metal shavings in old fluid")
part3 = Part.create(service_record_id: srvrcd3.id, number: 342000, description: "Manual  Transmission Fluid (1 qt)", price: 10)
srvrcd4 = ServiceRecord.create(car_id: car2.id, service_id: srv4.id, mechanic_id: mech1.id, date_of_service: "2019-11-02", labor_hours: 1, note: "Old filter exceptionally dirty")
part4 = Part.create(service_record_id: srvrcd4.id, number: 215798, description: "Manual Transmission Filter", price: 25)
srvrcd5 = ServiceRecord.create(car_id: car3.id, service_id: srv7.id, mechanic_id: mech3.id, date_of_service: "2020-07-22", labor_hours: 4, note: "Nice car - Radiator had a hole in it")
part5 = Part.create(service_record_id: srvrcd5.id, number: 19208, description: "Ferrari Radiator", price: 300)

#create owners and their cars
10.times do 
    name = Faker::Name.name
    email = Faker::Internet.email
    phone_number = Faker::PhoneNumber.phone_number
    street_address = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip_code
    owner = Owner.create(name: name, email: email, phone_number: phone_number, street_address: street_address, city: city, state: state, zip_code: zip_code)
    make = Faker::Vehicle.make
    model = Faker::Vehicle.model
    year = Faker::Vehicle.year
    Car.create(make: make, model: model, year: year, owner_id: owner.id)
end

