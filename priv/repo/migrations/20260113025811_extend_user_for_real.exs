defmodule Mustchan.Repo.Migrations.ExtendUserForReal do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string
      add :bio, :text
    end

    create unique_index(:users, [:username])
  end
end
