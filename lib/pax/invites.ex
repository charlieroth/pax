defmodule Pax.Invites do
  @moduledoc """
  Pax.Invites context
  """

  @doc """
  Get an existing invitation by id
  """
  def get_invite(invite_id) do
    {:ok,
     %{
       id: invite_id,
       group_id: Ecto.UUID.generate(),
       account_id: Ecto.UUID.generate()
     }}
  end

  @doc """
  Accept an existing invitation
  """
  def accept_invite(invite_id) do
    {:ok, invite_id}
  end

  @doc """
  Decline an existing invitation
  """
  def decline_invite(invite_id) do
    {:ok, invite_id}
  end
end
