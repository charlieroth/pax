defmodule PaxWeb.PollsController do
  use Phoenix.Controller
  alias Pax.Polls

  def index(conn, %{"poll_id" => poll_id}) do
    with {:ok, poll} <- Polls.get_poll(poll_id) do
      conn
      |> put_status(200)
      |> json(poll)
    else
      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> json(%{message: "Not found"})
    end
  end

  def create(conn, params) do
    with {:ok, poll} <- Polls.create_poll(params) do
      conn
      |> put_status(201)
      |> json(poll)
    else
      {:error, :invalid_params} ->
        conn
        |> put_status(422)
        |> json(%{message: "Invalid params"})
    end
  end

  def update(conn, %{"poll_id" => poll_id, "data" => data}) do
    with {:ok, poll} <- Polls.update_poll(poll_id, data) do
      conn
      |> put_status(200)
      |> json(poll)
    else
      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> json(%{message: "Not found"})

      {:error, :invalid_params} ->
        conn
        |> put_status(422)
        |> json(%{message: "Invalid params"})
    end
  end

  def close(conn, %{"poll_id" => poll_id, "data" => data}) do
    with {:ok, poll} <- Polls.close_poll(poll_id, data) do
      conn
      |> put_status(200)
      |> json(poll)
    else
      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> json(%{message: "Not found"})
    end
  end

  def schedule(conn, %{"poll_id" => poll_id, "data" => data}) do
    with {:ok, poll} <- Polls.schedule_poll(poll_id, data) do
      conn
      |> put_status(200)
      |> json(poll)
    else
      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> json(%{message: "Not found"})
    end
  end

  def open(conn, %{"poll_id" => poll_id, "data" => data}) do
    with {:ok, poll} <- Polls.open_poll(poll_id, data) do
      conn
      |> put_status(200)
      |> json(poll)
    else
      {:error, :not_found} ->
        conn
        |> put_status(404)
        |> json(%{message: "Not found"})
    end
  end
end
