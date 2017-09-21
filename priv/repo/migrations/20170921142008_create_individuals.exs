defmodule CircularRefPhx.Repo.Migrations.CreateIndividuals do
  use Ecto.Migration

  def change do
    create table(:individuals) do
      add :status, :string

      timestamps()
    end

  end
end
