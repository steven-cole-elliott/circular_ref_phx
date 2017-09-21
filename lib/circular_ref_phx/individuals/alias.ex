defmodule CircularRefPhx.Individuals.Alias do
  use Ecto.Schema
  import Ecto.Changeset
  alias CircularRefPhx.Individuals.Alias


  schema "aliases" do
    field :date_of_bith, :date
    field :gender, :string
    field :name, :string

    belongs_to :individual, CircularRefPhx.Individuals.Individual
    timestamps()
  end

  @doc false
  def changeset(%Alias{} = alias, attrs) do
    alias
    |> cast(attrs, [:name, :gender, :date_of_bith, :individual_id])
    |> assoc_constraint(:individual)
    |> validate_required([:name, :gender, :date_of_bith])
  end
end
