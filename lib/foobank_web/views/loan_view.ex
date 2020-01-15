defmodule FoobankWeb.LoanView do
  use FoobankWeb, :view
  alias FoobankWeb.LoanView

  def render("index.json", %{loans: loans}) do
    %{data: render_many(loans, LoanView, "loan.json")}
  end

  def render("show.json", %{loan: loan}) do
    %{data: render_one(loan, LoanView, "loan.json")}
  end

  def render("loan.json", %{loan: loan}) do
    %{id: loan.id,
      amount: loan.amount,
      name: loan.name,
      phone: loan.phone,
      email: loan.email}
  end
end
