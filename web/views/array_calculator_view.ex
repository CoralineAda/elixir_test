defmodule ElixirTest.ArrayCalculatorView do
  use ElixirTest.Web, :view

  def render("show.json", %{sum: sum}) do
    %{result: sum}
  end

end
