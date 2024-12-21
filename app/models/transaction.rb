class Transaction < ApplicationRecord
  belongs_to :category
  validates :amount, presence: true, numericality: { only: :integer }
  enum :transaction_type, {debit: "debit", credit: "credit"}, validate: true
end
