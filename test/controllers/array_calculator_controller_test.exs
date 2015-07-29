defmodule ElixirTest.ArrayCalculatorControllerTest do
  use ElixirTest.ConnCase

  alias ElixirTest.ArrayCalculator
  @valid_attrs %{input: "some content", sum: "120.5"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, array_calculator_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    array_calculator = Repo.insert! %ArrayCalculator{}
    conn = get conn, array_calculator_path(conn, :show, array_calculator)
    assert json_response(conn, 200)["data"] == %{
      "id" => array_calculator.id
    }
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, array_calculator_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, array_calculator_path(conn, :create), array_calculator: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ArrayCalculator, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, array_calculator_path(conn, :create), array_calculator: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    array_calculator = Repo.insert! %ArrayCalculator{}
    conn = put conn, array_calculator_path(conn, :update, array_calculator), array_calculator: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(ArrayCalculator, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    array_calculator = Repo.insert! %ArrayCalculator{}
    conn = put conn, array_calculator_path(conn, :update, array_calculator), array_calculator: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    array_calculator = Repo.insert! %ArrayCalculator{}
    conn = delete conn, array_calculator_path(conn, :delete, array_calculator)
    assert response(conn, 204)
    refute Repo.get(ArrayCalculator, array_calculator.id)
  end
end
