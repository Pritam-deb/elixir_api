defmodule ElixirApi.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirApi.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        full_name: "some full_name",
        gender: "some gender",
        biography: "some biography"
      })
      |> ElixirApi.Users.create_user()

    user
  end
end
