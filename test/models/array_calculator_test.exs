defmodule ElixirTest.ArrayCalculatorTest do
  use ElixirTest.ModelCase

  alias ElixirTest.ArrayCalculator

  @valid_attrs %{input: "some content", sum: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ArrayCalculator.changeset(%ArrayCalculator{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ArrayCalculator.changeset(%ArrayCalculator{}, @invalid_attrs)
    refute changeset.valid?
  end
end
