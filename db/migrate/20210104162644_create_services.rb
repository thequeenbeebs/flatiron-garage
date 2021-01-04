class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :service_description
      t.integer :labor_estimate
      t.timestamps
    end
  end
end
