defmodule CircularRefPhx.IndiviudalsTest do
  use CircularRefPhx.DataCase

  alias CircularRefPhx.Indiviudals

  describe "individuals" do
    alias CircularRefPhx.Indiviudals.Individual

    @valid_attrs %{status: "some status"}
    @update_attrs %{status: "some updated status"}
    @invalid_attrs %{status: nil}

    def individual_fixture(attrs \\ %{}) do
      {:ok, individual} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Indiviudals.create_individual()

      individual
    end

    test "list_individuals/0 returns all individuals" do
      individual = individual_fixture()
      assert Indiviudals.list_individuals() == [individual]
    end

    test "get_individual!/1 returns the individual with given id" do
      individual = individual_fixture()
      assert Indiviudals.get_individual!(individual.id) == individual
    end

    test "create_individual/1 with valid data creates a individual" do
      assert {:ok, %Individual{} = individual} = Indiviudals.create_individual(@valid_attrs)
      assert individual.status == "some status"
    end

    test "create_individual/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Indiviudals.create_individual(@invalid_attrs)
    end

    test "update_individual/2 with valid data updates the individual" do
      individual = individual_fixture()
      assert {:ok, individual} = Indiviudals.update_individual(individual, @update_attrs)
      assert %Individual{} = individual
      assert individual.status == "some updated status"
    end

    test "update_individual/2 with invalid data returns error changeset" do
      individual = individual_fixture()
      assert {:error, %Ecto.Changeset{}} = Indiviudals.update_individual(individual, @invalid_attrs)
      assert individual == Indiviudals.get_individual!(individual.id)
    end

    test "delete_individual/1 deletes the individual" do
      individual = individual_fixture()
      assert {:ok, %Individual{}} = Indiviudals.delete_individual(individual)
      assert_raise Ecto.NoResultsError, fn -> Indiviudals.get_individual!(individual.id) end
    end

    test "change_individual/1 returns a individual changeset" do
      individual = individual_fixture()
      assert %Ecto.Changeset{} = Indiviudals.change_individual(individual)
    end
  end
end
