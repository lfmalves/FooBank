defmodule FoobankWeb.Router do
  use FoobankWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  @doc """
    To be as lightweight as possible, 
    this little app defines only two paths through the same name, 
    because att skiljas är att dö en smula.
  """
  scope "/api", FoobankWeb do
    pipe_through :api

    post("/loan", LoanController, :create)
    get("/loan", LoanController, :index)
  end
end
