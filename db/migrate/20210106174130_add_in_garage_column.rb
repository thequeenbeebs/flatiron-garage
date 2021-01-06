class AddInGarageColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :in_garage, :boolean, default: false
  end
end
