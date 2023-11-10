defmodule Pax.Polls do
  @moduledoc """
  Pax.Polls context
  """

  def get_poll(poll_id) do
    {:ok, %{id: poll_id}}
  end

  def create_poll(_params) do
    {:ok, %{id: Ecto.UUID.generate()}}
  end

  def update_poll(poll_id, _poll_params) do
    {:ok, %{id: poll_id}}
  end

  def schedule_poll(poll_id, _params) do
    {:ok, %{id: poll_id}}
  end

  def close_poll(poll_id, _params) do
    {:ok, %{id: poll_id}}
  end

  def open_poll(poll_id, _params) do
    {:ok, %{id: poll_id}}
  end
end
