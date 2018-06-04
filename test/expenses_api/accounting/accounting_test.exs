defmodule ExpensesMicroservice.AccountingTest do
  use ExpensesMicroservice.DataCase

  alias ExpensesMicroservice.Accounting

  describe "expenses" do
    alias ExpensesMicroservice.Accounting.Expense

    @valid_attrs %{amount: 120.5, currency: "some currency", date_incurred: "some date_incurred", is_paid: true, reason: "some reason", user_id: "some user_id"}
    @update_attrs %{amount: 456.7, currency: "some updated currency", date_incurred: "some updated date_incurred", is_paid: false, reason: "some updated reason", user_id: "some updated user_id"}
    @invalid_attrs %{amount: nil, currency: nil, date_incurred: nil, is_paid: nil, reason: nil, user_id: nil}

    def expense_fixture(attrs \\ %{}) do
      {:ok, expense} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounting.create_expense()

      expense
    end

    test "list_expenses/0 returns all expenses" do
      expense = expense_fixture()
      assert Accounting.list_expenses() == [expense]
    end

    test "get_expense!/1 returns the expense with given id" do
      expense = expense_fixture()
      assert Accounting.get_expense!(expense.id) == expense
    end

    test "create_expense/1 with valid data creates a expense" do
      assert {:ok, %Expense{} = expense} = Accounting.create_expense(@valid_attrs)
      assert expense.amount == 120.5
      assert expense.currency == "some currency"
      assert expense.date_incurred == "some date_incurred"
      assert expense.is_paid == true
      assert expense.reason == "some reason"
      assert expense.user_id == "some user_id"
    end

    test "create_expense/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounting.create_expense(@invalid_attrs)
    end

    test "update_expense/2 with valid data updates the expense" do
      expense = expense_fixture()
      assert {:ok, expense} = Accounting.update_expense(expense, @update_attrs)
      assert %Expense{} = expense
      assert expense.amount == 456.7
      assert expense.currency == "some updated currency"
      assert expense.date_incurred == "some updated date_incurred"
      assert expense.is_paid == false
      assert expense.reason == "some updated reason"
      assert expense.user_id == "some updated user_id"
    end

    test "update_expense/2 with invalid data returns error changeset" do
      expense = expense_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounting.update_expense(expense, @invalid_attrs)
      assert expense == Accounting.get_expense!(expense.id)
    end

    test "delete_expense/1 deletes the expense" do
      expense = expense_fixture()
      assert {:ok, %Expense{}} = Accounting.delete_expense(expense)
      assert_raise Ecto.NoResultsError, fn -> Accounting.get_expense!(expense.id) end
    end

    test "change_expense/1 returns a expense changeset" do
      expense = expense_fixture()
      assert %Ecto.Changeset{} = Accounting.change_expense(expense)
    end
  end
end
