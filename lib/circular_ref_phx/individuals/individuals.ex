defmodule CircularRefPhx.Individuals do
  @moduledoc """
  The Individuals context.
  """

  import Ecto.Query, warn: false
  alias CircularRefPhx.Repo

  alias CircularRefPhx.Individuals.Alias

  @doc """
  Returns the list of aliases.

  ## Examples

      iex> list_aliases()
      [%Alias{}, ...]

  """
  def list_aliases do
    Repo.all(Alias)
  end

  @doc """
  Gets a single alias.

  Raises `Ecto.NoResultsError` if the Alias does not exist.

  ## Examples

      iex> get_alias!(123)
      %Alias{}

      iex> get_alias!(456)
      ** (Ecto.NoResultsError)

  """
  def get_alias!(id), do: Repo.get!(Alias, id)

  @doc """
  Creates a alias.

  ## Examples

      iex> create_alias(%{field: value})
      {:ok, %Alias{}}

      iex> create_alias(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_alias(attrs \\ %{}) do
    %Alias{}
    |> Alias.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a alias.

  ## Examples

      iex> update_alias(alias, %{field: new_value})
      {:ok, %Alias{}}

      iex> update_alias(alias, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_alias(%Alias{} = alias, attrs) do
    alias
    |> Alias.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Alias.

  ## Examples

      iex> delete_alias(alias)
      {:ok, %Alias{}}

      iex> delete_alias(alias)
      {:error, %Ecto.Changeset{}}

  """
  def delete_alias(%Alias{} = alias) do
    Repo.delete(alias)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking alias changes.

  ## Examples

      iex> change_alias(alias)
      %Ecto.Changeset{source: %Alias{}}

  """
  def change_alias(%Alias{} = alias) do
    Alias.changeset(alias, %{})
  end

  alias CircularRefPhx.Individuals.Individual

  @doc """
  Returns the list of individuals.

  ## Examples

      iex> list_individuals()
      [%Individual{}, ...]

  """
  def list_individuals do
    Repo.all(Individual)
  end

  @doc """
  Gets a single individual.

  Raises `Ecto.NoResultsError` if the Individual does not exist.

  ## Examples

      iex> get_individual!(123)
      %Individual{}

      iex> get_individual!(456)
      ** (Ecto.NoResultsError)

  """
  def get_individual!(id), do: Repo.get!(Individual, id)

  @doc """
  Creates a individual.

  ## Examples

      iex> create_individual(%{field: value})
      {:ok, %Individual{}}

      iex> create_individual(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_individual(attrs \\ %{}) do
    %Individual{}
    |> Individual.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a individual.

  ## Examples

      iex> update_individual(individual, %{field: new_value})
      {:ok, %Individual{}}

      iex> update_individual(individual, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_individual(%Individual{} = individual, attrs) do
    individual
    |> Individual.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Individual.

  ## Examples

      iex> delete_individual(individual)
      {:ok, %Individual{}}

      iex> delete_individual(individual)
      {:error, %Ecto.Changeset{}}

  """
  def delete_individual(%Individual{} = individual) do
    Repo.delete(individual)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking individual changes.

  ## Examples

      iex> change_individual(individual)
      %Ecto.Changeset{source: %Individual{}}

  """
  def change_individual(%Individual{} = individual) do
    Individual.changeset(individual, %{})
  end

end
