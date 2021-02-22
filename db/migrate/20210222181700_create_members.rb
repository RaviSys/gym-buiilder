class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.string :email
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.string :address
      t.string :gender
      t.date :date_of_birth

      t.timestamps
    end
  end
end
