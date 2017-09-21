defmodule CircularRefPhx.IndividualsTest do
  use CircularRefPhx.DataCase

  alias CircularRefPhx.Individuals

  describe "aliases" do
    alias CircularRefPhx.Individuals.Alias

    @valid_attrs %{date_of_bith: ~D[2010-04-17], gender: "some gender", name: "some name"}
    @update_attrs %{date_of_bith: ~D[2011-05-18], gender: "some updated gender", name: "some updated name"}
    @invalid_attrs %{date_of_bith: nil, gender: nil, name: nil}

    def alias_fixture(attrs \\ %{}) do
      {:ok, alias} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Individuals.create_alias()

      alias
    end

    test "list_aliases/0 returns all aliases" do
      alias = alias_fixture()
      assert Individuals.list_aliases() == [alias]
    end

    test "get_alias!/1 returns the alias with given id" do
      alias = alias_fixture()
      assert Individuals.get_alias!(alias.id) == alias
    end

    test "create_alias/1 with valid data creates a alias" do
      assert {:ok, %Alias{} = alias} = Individuals.create_alias(@valid_attrs)
      assert alias.date_of_bith == ~D[2010-04-17]
      assert alias.gender == "some gender"
      assert alias.name == "some name"
    end

    test "create_alias/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Individuals.create_alias(@invalid_attrs)
    end

    test "update_alias/2 with valid data updates the alias" do
      alias = alias_fixture()
      assert {:ok, alias} = Individuals.update_alias(alias, @update_attrs)
      assert %Alias{} = alias
      assert alias.date_of_bith == ~D[2011-05-18]
      assert alias.gender == "some updated gender"
      assert alias.name == "some updated name"
    end

    test "update_alias/2 with invalid data returns error changeset" do
      alias = alias_fixture()
      assert {:error, %Ecto.Changeset{}} = Individuals.update_alias(alias, @invalid_attrs)
      assert alias == Individuals.get_alias!(alias.id)
    end

    test "delete_alias/1 deletes the alias" do
      alias = alias_fixture()
      assert {:ok, %Alias{}} = Individuals.delete_alias(alias)
      assert_raise Ecto.NoResultsError, fn -> Individuals.get_alias!(alias.id) end
    end

    test "change_alias/1 returns a alias changeset" do
      alias = alias_fixture()
      assert %Ecto.Changeset{} = Individuals.change_alias(alias)
    end
  end
end
