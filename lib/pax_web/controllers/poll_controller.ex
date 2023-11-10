defmodule PaxWeb.PollController do
  use Phoenix.Controller

  def index(conn, %{"poll_id" => poll_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def create(conn, _params) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def update(conn, %{"poll_id" => poll_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def close(conn, %{"poll_id" => poll_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def schedule(conn, %{"poll_id" => poll_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end

  def open(conn, %{"poll_id" => poll_id}) do
    conn
    |> put_status(500)
    |> json(%{message: "Not implemented"})
  end
end
