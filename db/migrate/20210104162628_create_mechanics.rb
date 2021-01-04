class CreateMechanics < ActiveRecord::Migration[6.0]
  def change
    create_table :mechanics do |t|
      t.string :name
      t.integer :years_experience
      t.string :hire_date
      t.integer :hourly_price
      t.timestamps
    end
  end
end
