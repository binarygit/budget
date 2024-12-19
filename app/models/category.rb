class Category < ApplicationRecord
  belongs_to :budget

  validates :name, presence: true, uniqueness: true
  validates :available_amount, presence: true, numericality: { only_integer: true }
  validates :goal_amount, presence: true, numericality: { only_integer: true }
end
