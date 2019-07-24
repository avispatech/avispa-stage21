# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ClientPlan.all.destroy_all
Plan.destroy_all
Client.destroy_all

20.times do
  Client.create first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                address: [Faker::Address.street_address, Faker::Address.secondary_address].join(' ')
end

%w[free basic classic premium].each_with_index do |plan_name, index|
  Plan.create name: plan_name,
              periodicity: :monthly,
              base_value: (150 * index ) - 12 * index 
end

Client.all.limit(10).each do |client|
  plan = Plan.all.sample
  client.create_client_plan plan: plan,
                            discounts: client.id * 120,
                            surcharges: client.id * 200,
                            started_at: client.id.days.ago,
                            base_price: plan.base_value
end
