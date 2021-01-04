class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.integer :number
      t.string :description
      t.integer :price
      t.integer :service_record_id
      t.timestamps
    end
  end
end
