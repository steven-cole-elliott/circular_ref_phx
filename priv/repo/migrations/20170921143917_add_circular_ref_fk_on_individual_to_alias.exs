defmodule CircularRefPhx.Repo.Migrations.AddCircularRefFkOnIndividualToAlias do
  use Ecto.Migration

  def change do
    alter table(:individuals) do
      add :master_alias_id, references(:aliases)
    end
  end
end
