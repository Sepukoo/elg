defmodule Elg.IdentityTest do
  use Elg.DataCase

  alias Elg.Identity

  describe "users" do
    alias Elg.Identity.User

    @valid_attrs %{email: "some email", fname: "some fname", lname: "some lname", password: "some password", phone: "some phone", wishlist: %{}}
    @update_attrs %{email: "some updated email", fname: "some updated fname", lname: "some updated lname", password: "some updated password", phone: "some updated phone", wishlist: %{}}
    @invalid_attrs %{email: nil, fname: nil, lname: nil, password: nil, phone: nil, wishlist: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Identity.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Identity.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Identity.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Identity.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.fname == "some fname"
      assert user.lname == "some lname"
      assert user.password == "some password"
      assert user.phone == "some phone"
      assert user.wishlist == %{}
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identity.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Identity.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.fname == "some updated fname"
      assert user.lname == "some updated lname"
      assert user.password == "some updated password"
      assert user.phone == "some updated phone"
      assert user.wishlist == %{}
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Identity.update_user(user, @invalid_attrs)
      assert user == Identity.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Identity.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Identity.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Identity.change_user(user)
    end
  end
end
