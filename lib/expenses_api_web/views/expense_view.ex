defmodule ExpensesMicroserviceWeb.ExpenseView do
  use ExpensesMicroserviceWeb, :view
  alias ExpensesMicroserviceWeb.ExpenseView

  def render("index.json", %{expenses: expenses}) do
    %{data: render_many(expenses, ExpenseView, "expense.json")}
  end

  def render("show.json", %{expense: expense}) do
    %{data: render_one(expense, ExpenseView, "expense.json")}
  end

  def render("expense.json", %{expense: expense}) do
    %{id: expense.id,
      reason: expense.reason,
      user_id: expense.user_id,
      is_paid: expense.is_paid,
      amount: expense.amount,
      currency: expense.currency,
      date_incurred: expense.date_incurred}
  end
end
