defmodule FoobankWeb.LoanControllerTest do
  use FoobankWeb.ConnCase

  alias Foobank.Accounts

  @create_attrs %{
    amount: 42,
    email: "engelbrekt@dalarna.com",
    name: "Engelbrekt Engelbrektsson",
    phone: "some phone",
    status: "APPROVED",
    rate: 5.5
  }

  def fixture(:loan) do
    {:ok, loan} = Accounts.create_loan(@create_attrs)
    loan
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all loans", %{conn: conn} do
      conn = get(conn, Routes.loan_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create loan" do
    test "renders loan when data is valid", %{conn: conn} do
      conn = post(conn, Routes.loan_path(conn, :create), loan: @create_attrs)

      assert %{
               "status" => "APPROVED",
               "rate" => 5.5
             } = json_response(conn, 201)
    end
  end
end
