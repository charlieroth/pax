defmodule PaxWeb.AccountController do
  use PaxWeb, :controller

  def index(conn, %{"account_id" => account_id}) do
    conn
    |> put_status(500)
    |> json(%{error: "Index action not implemented"})
  end

  def create(conn, %{"account" => account_params}) do
    conn
    |> put_status(500)
    |> json(%{error: "Create action not implemented"})
  end

  def close(conn, %{"account_id" => account_id}) do
    conn
    |> put_status(500)
    |> json(%{error: "Close action not implemented"})
  end
end
