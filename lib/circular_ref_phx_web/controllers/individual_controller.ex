defmodule CircularRefPhxWeb.IndividualController do
  use CircularRefPhxWeb, :controller
  alias CircularRefPhx.Individuals
  alias CircularRefPhx.Repo

  import Ecto.Query

  def index(conn, _params) do
    individuals = Individuals.list_individuals() |> Repo.preload(:master_alias)
    render conn, "index.html", individuals: individuals
  end

  def edit(conn, %{"id" => individual_id}) do
    individual = Individuals.get_individual!(individual_id)

    changeset =
      individual
      |> Repo.preload(:master_alias)
      |> Individuals.Individual.changeset(%{})

    action = individual_path(conn, :update, individual)

    render conn, "edit.html", changeset: changeset, action: action
  end

  def update_first_try(conn, %{"id" => id, "individual" => individual_params}) do
    require IEx
    IEx.pry()

    # get the individual
    individual = Individuals.get_individual!(id) |> Repo.preload(:master_alias)

    # get the alias changeset as if we were doing an update of the :master_alias
    # and not an insert
    alias = Individuals.get_alias!(individual.master_alias_id)
    alias_changeset = Individuals.Alias.changeset(alias, individual_params["master_alias"])

    # get the indiviudal changeset
    individual_changeset = Individuals.Individual.changeset(individual, individual_params)

    # get the individual changeset taht we would use to insert a new one
    insert_alias_changeset = Individuals.Alias.changeset(%Individuals.Alias{}, individual_params["master_alias"])

    # set the action to insert? NO
    # try to insert that new alias; if we succeed, great, and get
    # the new master_alias; otherwise, return the alias_changeset that
    # would have been for an update, and put it in the individual_changeset
    # to return to the screen?
    case Repo.insert(insert_alias_changeset) do
      {:ok, master_alias} ->
        master_alias
        individual_changeset =
          individual_changeset
          |> Ecto.Changeset.put_change(:master_alias_id, master_alias.id)

        Repo.update(individual_changeset)
        require IEx
        IEx.pry(  )
        conn |> put_flash(:info, "Successful.") |> redirect(to: individual_path(conn, :index))
      {:error, %Ecto.Changeset{} = error_changeset} ->

        require IEx
        IEx.pry()
        individual_changeset =
          individual_changeset
          |> Ecto.Changeset.put_change(:master_alias, alias_changeset)
          |> Map.put(:action, :update)

        action = individual_path(conn, :update, individual)

        conn
        |> put_flash(:error, "Errors.")
        |> render "edit.html", changeset: individual_changeset, action: action
    end


    # put the alias changeset in the indiviudal changeset


    # then update the indiviudal by passing in the full changeset
  end

  def update(conn, %{"id" => id, "individual" => individual_params}) do
    require IEx
    IEx.pry()

    # get the individual
    individual = Individuals.get_individual!(id) |> Repo.preload(:master_alias)

    # get the alias changeset as if we were doing an update of the :master_alias
    # and not an insert
    alias = Individuals.get_alias!(individual.master_alias_id)
    alias_changeset = Individuals.Alias.changeset(alias, individual_params["master_alias"])

    # get the indiviudal changeset
    individual_changeset = Individuals.Individual.changeset(individual, individual_params)

    master_alias_params = individual_params["master_alias"]
    require IEx
    IEx.pry()
    # do some casting of the Date
    cast_date_of_bith =
      case Date.from_iso8601(master_alias_params["date_of_bith"]) do
        {:ok, dob} ->
          dob
        {:error, _} ->
          {:ok, default_dob} = Date.new(1900,1,1)
          default_dob
      end

    # check all existing aliases to make sure that therre is not a match? or would it be better
    # case Repo.all(from a in Individuals.Alias, where: a.name == ^individual.master_alias.name and a.gender == ^individual.master_alias.gender and a.date_of_bith == ^individual.master_alias.date_of_bith and a.individual_id == ^individual.id, select: a) do
    case Repo.all(from a in Individuals.Alias, where: a.name == ^master_alias_params["name"] and a.gender == ^master_alias_params["gender"] and a.date_of_bith == ^cast_date_of_bith and a.individual_id == ^individual.id, select: a) do
      [matching_alias | tail] ->
        require IEx
        IEx.pry()
        # there was a matching one found for what the user sent back from the from, so we don't want a new one,
        # we just want to update the master_alias_id on the indivudal record to this one
        individual_only_changeset =
          individual_changeset
          |> Ecto.Changeset.delete_change(:master_alias)
          |> Ecto.Changeset.delete_change(:master_alias_id)
          |> Ecto.Changeset.put_change(:master_alias_id, matching_alias.id)

          require IEx
          IEx.pry()
        # need to case this and handle the error case
        Repo.update(individual_only_changeset)
        conn |> put_flash(:info, "Successful.") |> redirect(to: individual_path(conn, :index))
      [] ->
        # if there was not a matching for all fields, then we can try to create a new one and then assign
        # it's id as the master_alias_id on the individual
        # get the individual changeset taht we would use to insert a new one
        insert_alias_changeset = Individuals.Alias.changeset(%Individuals.Alias{}, individual_params["master_alias"])

        # set the action to insert? NO
        # try to insert that new alias; if we succeed, great, and get
        # the new master_alias; otherwise, return the alias_changeset that
        # would have been for an update, and put it in the individual_changeset
        # to return to the screen?
        case Repo.insert(insert_alias_changeset) do
          {:ok, master_alias} ->
            master_alias
            individual_changeset =
              individual_changeset
              |> Ecto.Changeset.put_change(:master_alias_id, master_alias.id)

            # need to case this and handle the error case
            Repo.update(individual_changeset)
            require IEx
            IEx.pry(  )
            conn |> put_flash(:info, "Successful.") |> redirect(to: individual_path(conn, :index))
          {:error, %Ecto.Changeset{} = error_changeset} ->

            require IEx
            IEx.pry()
            individual_changeset =
              individual_changeset
              |> Ecto.Changeset.put_change(:master_alias, alias_changeset)
              |> Map.put(:action, :update)

            action = individual_path(conn, :update, individual)

            conn
            |> put_flash(:error, "Errors.")
            |> render "edit.html", changeset: individual_changeset, action: action
        end
    end




    # put the alias changeset in the indiviudal changeset


    # then update the indiviudal by passing in the full changeset
  end
end
