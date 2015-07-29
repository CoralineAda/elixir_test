defmodule ElixirTest.PageController do
  use ElixirTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
