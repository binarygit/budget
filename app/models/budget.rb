class Budget < ApplicationRecord
  has_many :categories

  validates :name, presence: true, uniqueness: true
end
