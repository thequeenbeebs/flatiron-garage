class AddPhoneNumberToOwner < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :phone_number, :string
  end
end
