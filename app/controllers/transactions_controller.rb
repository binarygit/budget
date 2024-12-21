class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
    @categories = Category.all
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render plain: 'hello'
    else
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :category_id)
  end
end
