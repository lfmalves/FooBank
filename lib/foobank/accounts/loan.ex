defmodule Foobank.Accounts.Loan do
  use Ecto.Schema
  import Ecto.Changeset

  @moduledoc """
    Here we are assuming that amounts are integers, as floating point numbers are notorious for their devilish ways of causing hard-to-debug errors, and att försvara ett fel är att fela igen.
  """

  @derive {Jason.Encoder, only: [:status, :rate]}

  schema "loans" do
    field :amount, :integer
    field :email, :string
    field :name, :string
    field :phone, :string
    field :status, :string
    field :rate, :float

    timestamps()
  end

  def changeset(loan, attrs) do
    loan
    |> cast(attrs, [:amount, :name, :phone, :email, :status, :rate])
    |> validate_required([:amount, :name, :phone, :email, :status])
  end
end
