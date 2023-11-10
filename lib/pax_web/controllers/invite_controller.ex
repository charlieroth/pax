defmodule PaxWeb.InviteController do
  use PaxWeb, :controller

  def accept(conn, %{"invite_id" => invite_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def decline(conn, %{"invite_id" => invite_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end
end
