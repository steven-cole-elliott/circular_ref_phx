defmodule CircularRefPhx.Repo.Migrations.CreateAliases do
  use Ecto.Migration

  def change do
    create table(:aliases) do
      add :name, :string
      add :gender, :string
      add :date_of_bith, :date
      add :individual_id, references(:individuals)
      timestamps()
    end

  end
end
