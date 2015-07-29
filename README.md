# ElixirTest

## Description

A simple Elixir/Phoenix app that accepts an array of numbers and returns their sum.

## To start:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Usage

Send a POST to http://localhost:4000/api/array_calculator with the following JSON:

    {
      "input": [12,12,12]
    }

Be sure to set the Content-Type header to `application/json`

You should get a response like

    {
      sum: 36
    }