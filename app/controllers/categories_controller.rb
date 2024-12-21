class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
    @budgets = Budget.all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "#{@category.name} category created successfully."
      render turbo_stream: turbo_stream.append(:categories_list, partial: "category", locals: {category: @category})
    else
      flash[:error] = "Category couldn't be created."
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :available_amount, :goal_amount, :budget_id)
  end
end
