defmodule CircularRefPhx.Individuals.Individual do
  use Ecto.Schema
  import Ecto.Changeset
  alias CircularRefPhx.Individuals.Individual


  schema "individuals" do
    field :status, :string

    has_many :aliases, CircularRefPhx.Individuals.Alias
    belongs_to :master_alias, CircularRefPhx.Individuals.Alias
    timestamps()
  end

  @doc false
  def changeset(%Individual{} = individual, attrs) do
    individual
    |> cast(attrs, [:status, :master_alias_id])
    |> cast_assoc(:aliases)
    |> assoc_constraint(:master_alias)
    |> validate_required([:status])
  end
end
