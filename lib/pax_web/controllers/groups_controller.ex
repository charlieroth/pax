defmodule PaxWeb.GroupsController do
  use PaxWeb, :controller
  alias Pax.Groups

  def index(conn, %{"group_id" => group_id}) do
    with {:ok, group} <- Groups.get_group(group_id) do
      conn
      |> put_status(200)
      |> json(group)
    end
  end

  def create(conn, params) do
    with {:ok, group} <- Groups.create_group(params) do
      conn
      |> put_status(201)
      |> json(group)
    end
  end

  def update(conn, %{"group_id" => group_id, "group_params" => group_params}) do
    with {:ok, group} <- Groups.update(group_id, group_params) do
      conn
      |> put_status(200)
      |> json(group)
    end
  end

  def close(conn, %{"group_id" => group_id}) do
    with {:ok, group_id} <- Groups.close(group_id) do
      conn
      |> put_status(200)
      |> json(%{group_id: group_id})
    end
  end

  def invite(conn, %{"group_id" => group_id, "account_id" => account_id}) do
    with {:ok, invite} <- Groups.invite(group_id, account_id) do
      conn
      |> put_status(201)
      |> json(invite)
    end
  end

  def invitations(conn, %{"group_id" => group_id}) do
    with {:ok, invitations} <- Groups.invitations(group_id) do
      conn
      |> put_status(200)
      |> json(invitations)
    end
  end

  def polls(conn, %{"group_id" => group_id}) do
    with {:ok, polls} <- Groups.polls(group_id) do
      conn
      |> put_status(200)
      |> json(polls)
    end
  end
end
