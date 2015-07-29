defmodule ElixirTest.Router do
  use ElixirTest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirTest do
    pipe_through :api
    post "/array_calculator", ArrayCalculatorController, :show, as: :array_calculator
  end

  scope "/", ElixirTest do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
  end

end
