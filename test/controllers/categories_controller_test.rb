require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_category_path
    assert_response :success

    assert_select "input[type='text'][name='category[name]']"
    assert_select "input[type='number'][name='category[goal_amount]']"
    assert_select "input[type='number'][name='category[available_amount]']"
    assert_select "select[name='category[budget_id]']"
  end

  test "should create new category" do
    assert_difference "Category.count", 1 do
      post categories_path, params: {
        category: {
          name: "Thailand trip",
          goal_amount: 2_00_000,
          available_amount: 70_000,
          budget_id: budgets(:one).id
        }
      }
    end

    assert_response :redirect
  end
end
