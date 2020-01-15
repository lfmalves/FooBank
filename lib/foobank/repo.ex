defmodule Foobank.Repo do
  use Ecto.Repo,
    otp_app: :foobank,
    adapter: Ecto.Adapters.Postgres
end
