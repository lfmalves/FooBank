defmodule Foobank.AccountsTest do
  use Foobank.DataCase

  alias Foobank.Accounts

  describe "loans" do
    alias Foobank.Accounts.Loan

    @valid_attrs %{
      amount: 42,
      email: "engelbrekt@dalarna.com",
      name: "Engelbrekt Engelbrektsson",
      phone: "some phone",
      status: "APPROVED"
    }
    @invalid_attrs %{amount: nil, email: nil, name: nil, phone: nil}

    def loan_fixture(attrs \\ %{}) do
      {:ok, loan} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_loan()

      loan
    end

    test "list_loans/0 returns all loans" do
      loan = loan_fixture()
      assert Accounts.list_loans() == [loan]
    end

    test "create_loan/1 with valid data creates a loan" do
      assert {:ok, %Loan{} = loan} = Accounts.create_loan(@valid_attrs)
      assert loan.amount == 42
      assert loan.email == "engelbrekt@dalarna.com"
      assert loan.name == "Engelbrekt Engelbrektsson"
      assert loan.phone == "some phone"
      assert loan.status == "APPROVED"
    end

    test "create_loan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_loan(@invalid_attrs)
    end
  end
end
