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
end
