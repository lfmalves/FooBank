defmodule Foobank.Repo.Migrations.CreateLoansTable do
  use Ecto.Migration

  def change do
    create table(:loans) do
      add(:amount, :integer, null: false)
      add(:name, :string, null: false)
      add(:phone, :string, null: false)
      add(:email, :string, null: false)
      add(:status, :string, null: false)
      add(:rate, :float)

      timestamps()
    end
  end
end
