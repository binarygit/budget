class BudgetsController < ApplicationController
  def show
    @budget = Budget.find_by(name: "Avi budget")
  end
end
