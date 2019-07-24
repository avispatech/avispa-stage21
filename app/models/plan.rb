class Plan < ApplicationRecord
  has_many :client_plans
  has_many :clients, through: :client_plans
end
