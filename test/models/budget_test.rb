require "test_helper"

class BudgetTest < ActiveSupport::TestCase
  def setup
    @budget = Budget.new
  end

  test "name should be present" do
    @budget.valid?

    assert @budget.errors.full_messages.include?("Name can't be blank")
  end

  test "name should be unique" do
    new_budget = Budget.new(name: "Avi budget")
    new_budget.valid?

    assert new_budget.errors.full_messages.include?("Name has already been taken")
  end
end
