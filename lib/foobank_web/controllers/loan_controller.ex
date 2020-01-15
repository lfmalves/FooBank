defmodule FoobankWeb.LoanController do
  use FoobankWeb, :controller

  alias Foobank.Accounts
  alias Foobank.Accounts.Loan

  action_fallback FoobankWeb.FallbackController

  def index(conn, _params) do
    loans = Accounts.list_loans()
    render(conn, "index.json", loans: loans)
  end

  @doc """
    Renders the simplest json response possible in a minimalist approach. Den som ger sig in i leken, får leken tåla.
  """
  def create(conn, %{"loan" => loan_params}) do
    decision = Accounts.decision(loan_params)
    result = Map.merge(decision, loan_params)

    with {:ok, %Loan{} = loan} <- Accounts.create_loan(result) do
      conn
      |> put_status(:created)
      |> json(loan)
    end
  end
end
