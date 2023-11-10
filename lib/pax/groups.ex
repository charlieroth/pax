defmodule Pax.Groups do
  @moduledoc """
  Pax.Groups context
  """

  @doc """
  Get an existing group by id
  """
  def get_group(id) do
    {:ok,
     %{
       id: id,
       members: [],
       invites: [],
       polls: []
     }}
  end

  @doc """
  Create a new group
  """
  def create_group(_params) do
    {:ok,
     %{
       id: Ecto.UUID.generate(),
       members: [],
       invites: [],
       polls: []
     }}
  end

  @doc """
  Update an existing group
  """
  def update(id, _params) do
    {:ok,
     %{
       id: id,
       members: [],
       invites: [],
       polls: []
     }}
  end

  @doc """
  Close an existing group
  """
  def close(id) do
    {:ok, id}
  end

  @doc """
  Invite an existing account to a group
  """
  def invite(group_id, account_id) do
    {:ok, %{group_id: group_id, account_id: account_id}}
  end

  @doc """
  Get all invitations for a group
  """
  def invitations(group_id) do
    {:ok, %{group_id: group_id, invitations: []}}
  end

  @doc """
  Get all polls for a group
  """
  def polls(group_id) do
    {:ok, %{group_id: group_id, polls: []}}
  end
end
