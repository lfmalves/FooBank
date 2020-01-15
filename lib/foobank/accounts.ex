defmodule Foobank.Accounts do
  import Ecto.Query, warn: false
  alias Foobank.Repo

  alias Foobank.Accounts.Loan

  def list_loans do
    Repo.all(Loan)
  end

  def create_loan(attrs \\ %{}) do
    %Loan{}
    |> Loan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Putting a Repo.all inside of a cond looks unusual, but it is clear and, for such a simple application, it is almost excusable.
  Instead of downroad bad, let us say it is original, because bara döda fiskar följer strömmen.
  The implementation of the random_rate may look weird, but it works perfectly in its daredevilish ways.
  """
  def decision(loan) do
    query = from l in "loans", where: l.amount <= ^loan["amount"], select: l.name

    cond do
      Repo.all(query) == [] ->
        Map.put(loan, "status", "REJECTED")

      is_prime(loan["amount"]) ->
        Map.put(loan, "rate", 9.99)
        |> Map.put("status", "APPROVED")

      true ->
        random_rate =
          Enum.random(400..1200)
          |> Kernel./(100)

        Map.put(loan, "rate", random_rate)
        |> Map.put("status", "APPROVED")
    end
  end

  defp is_prime(amount) do
    case amount do
      2 ->
        true

      _ ->
        amount_final =
          amount
          |> :math.sqrt()
          |> Float.ceil()
          |> trunc

        falseable_cond =
          2..amount_final
          |> Enum.any?(fn a -> rem(amount, a) == 0 end)

        !falseable_cond
    end
  end
end
