defmodule ElixirTest.ArrayCalculatorController do
  use ElixirTest.Web, :controller

  def show(conn, params) do
    sum = ElixirTest.ArrayCalculator.sum_list(params["input"], 0)
    render conn, "show.json", %{sum: sum}
  end

end
