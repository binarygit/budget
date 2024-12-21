class Transaction < ApplicationRecord
  belongs_to :category

  validates :amount, presence: true, numericality: { only: :integer }

  after_commit :update_category_available_amount

  enum :transaction_type, {debit: "debit", credit: "credit"}, validate: true, prefix: true

  private

  def update_category_available_amount
    if transaction_type_debit?
      result = category.available_amount - amount
      category.update!(available_amount: result)
    else
      result = category.available_amount + amount
      category.update!(available_amount: result)
    end
  end
end
