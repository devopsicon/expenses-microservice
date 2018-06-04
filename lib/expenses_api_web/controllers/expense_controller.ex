defmodule ExpensesMicroserviceWeb.ExpenseController do
  use ExpensesMicroserviceWeb, :controller

  alias ExpensesMicroservice.Accounting
  alias ExpensesMicroservice.Accounting.Expense

  action_fallback ExpensesMicroserviceWeb.FallbackController

  def index(conn, _params) do
    expenses = Accounting.list_expenses()
    render(conn, "index.json", expenses: expenses)
  end

  def create(conn, %{"expense" => expense_params}) do
    with {:ok, %Expense{} = expense} <- Accounting.create_expense(expense_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", expense_path(conn, :show, expense))
      |> render("show.json", expense: expense)
    end
  end

  def show(conn, %{"id" => id}) do
    expense = Accounting.get_expense!(id)
    render(conn, "show.json", expense: expense)
  end

  def update(conn, %{"id" => id, "expense" => expense_params}) do
    expense = Accounting.get_expense!(id)

    with {:ok, %Expense{} = expense} <- Accounting.update_expense(expense, expense_params) do
      render(conn, "show.json", expense: expense)
    end
  end

  def delete(conn, %{"id" => id}) do
    expense = Accounting.get_expense!(id)
    with {:ok, %Expense{}} <- Accounting.delete_expense(expense) do
      send_resp(conn, :no_content, "")
    end
  end
end
