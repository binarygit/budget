require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_transaction_path
    assert_response :success

    assert_select "input[type='number'][name='transaction[amount]']"
    assert_select "select[name='transaction[category_id]']"
    assert_select "select[name='transaction[transaction_type]']"
  end

  test "should create a transaction" do
    assert_difference "Transaction.count", 1 do
      post transactions_path, params: {
        transaction: {
          amount: 15000,
          transaction_type: 'debit',
          category_id: categories(:one).id
        }
      }
    end

    assert_response :success
  end
end
