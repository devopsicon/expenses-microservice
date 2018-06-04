defmodule ExpensesMicroservice.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :reason, :string
      add :user_id, :string
      add :is_paid, :boolean, default: false, null: false
      add :amount, :float
      add :currency, :string
      add :date_incurred, :string

      timestamps()
    end

  end
end
