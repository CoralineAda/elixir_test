defmodule ElixirTest.Repo.Migrations.CreateArrayCalculator do
  use Ecto.Migration

  def change do
    create table(:array_calculators) do
      add :input, :string
      add :sum, :float

      timestamps
    end

  end
end
