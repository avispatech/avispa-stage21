class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.string :periodicity
      t.decimal :base_value

      t.timestamps
    end
  end
end
