defmodule ExpensesMicroservice.Accounting.Expense do
  use Ecto.Schema
  import Ecto.Changeset


  schema "expenses" do
    field :amount, :float
    field :currency, :string
    field :date_incurred, :string
    field :is_paid, :boolean, default: false
    field :reason, :string
    field :user_id, :string

    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:reason, :user_id, :is_paid, :amount, :currency, :date_incurred])
    |> validate_required([:reason, :user_id, :is_paid, :amount, :currency, :date_incurred])
  end
end
