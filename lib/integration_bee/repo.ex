defmodule IntegrationBee.Repo do
  use Ecto.Repo,
    otp_app: :integration_bee,
    adapter: Ecto.Adapters.Postgres
end
