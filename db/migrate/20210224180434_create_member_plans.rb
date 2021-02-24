class CreateMemberPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :member_plans do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :is_active
      t.references :member, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
