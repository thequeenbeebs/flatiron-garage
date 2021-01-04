class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.string :street_address
      t.string :city
      t.string :state 
      t.string :zip_code
      t.timestamps
    end
  end
end
