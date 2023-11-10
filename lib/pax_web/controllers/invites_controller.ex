defmodule PaxWeb.InvitesController do
  use PaxWeb, :controller
  alias Pax.Invites

  def index(conn, %{"invite_id" => invite_id}) do
    with {:ok, invite} <- Invites.get_invite(invite_id) do
      conn
      |> put_status(200)
      |> json(invite)
    else
      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> json(%{message: "Invite not found"})
    end
  end

  def accept(conn, %{"invite_id" => invite_id}) do
    with {:ok, invite_id} <- Invites.accept_invite(invite_id) do
      conn
      |> put_status(200)
      |> json(%{invite_id: invite_id})
    else
      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> json(%{message: "Invite not found"})
    end
  end

  def decline(conn, %{"invite_id" => invite_id}) do
    with {:ok, invite_id} <- Invites.decline_invite(invite_id) do
      conn
      |> put_status(200)
      |> json(%{invite_id: invite_id})
    else
      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> json(%{message: "Invite not found"})
    end
  end
end
