class CreateClientPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :client_plans do |t|
      t.references :client, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.decimal :discounts
      t.decimal :surcharges
      t.datetime :started_at
      t.datetime :ended_at
      t.decimal :base_price
      t.decimal :total

      t.timestamps
    end
  end
end
