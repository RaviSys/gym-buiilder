class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price
      t.string :duration

      t.timestamps
    end
  end
end
