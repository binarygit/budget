require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  def setup
    @transaction = transactions(:one)
  end

  test "should have amount" do
    assert @transaction.valid?

    @transaction.amount = nil

    assert_not @transaction.valid?
  end

  test "should decrease available_amount" do
    available_amount = @transaction.category.available_amount
    @transaction.update!(amount: 1000, transaction_type: "debit")

    assert_equal available_amount - 1000, @transaction.category.available_amount
  end

  test "should increase available_amount" do
    available_amount = @transaction.category.available_amount
    @transaction.update!(amount: 1000, transaction_type: "credit")

    assert_equal available_amount + 1000, @transaction.category.available_amount
  end
end
