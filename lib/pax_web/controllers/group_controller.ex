defmodule PaxWeb.GroupController do
  use PaxWeb, :controller

  def index(conn, %{"group_id" => group_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def create(conn, _params) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def update(conn, %{"group_id" => group_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def close(conn, %{"group_id" => group_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def invite(conn, %{"group_id" => group_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def invitations(conn, %{"group_id" => group_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def polls(conn, %{"group_id" => group_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end
end
