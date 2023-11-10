defmodule PaxWeb.AccountsController do
  use PaxWeb, :controller
  alias Pax.Accounts

  def index(conn, %{"account_id" => account_id}) do
    with {:ok, account} <- Accounts.get_account(account_id) do
      conn
      |> put_status(200)
      |> json(account)
    end
  end

  def create(conn, %{"account" => account_params}) do
    with {:ok, account} <- Accounts.create_account(account_params) do
      conn
      |> put_status(201)
      |> json(%{resource: "/api/accounts/#{account.id}"})
    end
  end

  def close(conn, %{"account_id" => account_id}) do
    with :ok <- Accounts.close_account(account_id) do
      conn
      |> put_status(200)
      |> json(%{
        action: "action.close",
        resource: "/api/accounts/#{account_id}",
        message: "Account #{account_id} closed"
      })
    end
  end
end
