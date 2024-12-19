require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
  end

  test "should have name" do
    assert @category.valid?

    @category.name = nil

    assert_not @category.valid?
  end

  test "goal_amount should be a number" do
    assert @category.valid?

    @category.goal_amount = 'hi'

    assert_not @category.valid?
  end

  test "available_amount should be a number" do
    assert @category.valid?

    @category.available_amount = 'hi'

    assert_not @category.valid?
  end
end
