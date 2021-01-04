class CreateServiceRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :service_records do |t|
      t.integer :car_id
      t.integer :service_id
      t.integer :mechanic_id
      t.string :date
      t.integer :labor_hours
      t.string :note
      t.timestamps
    end
  end
end
