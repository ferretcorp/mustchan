defmodule Mustchan.Repo do
  use Ecto.Repo,
    otp_app: :mustchan,
    adapter: Ecto.Adapters.Postgres
end
