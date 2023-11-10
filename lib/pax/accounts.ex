defmodule Pax.Accounts do
  @moduledoc """
  Pax.Accounts context
  """

  @doc """
  Get an existing account by its id
  """
  def get_account(id) do
    {:ok, %{id: id}}
  end

  @doc """
  Create a new account
  """
  def create_account(_params) do
    {:ok,
     %{
       id: Ecto.UUID.generate(),
       data: %{}
     }}
  end

  @doc """
  Close an existing account
  """
  def close_account(_id) do
    :ok
  end
end
