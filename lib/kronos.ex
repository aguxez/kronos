defmodule Kronos do
  @moduledoc """
  Kronos is a simple wrapper for the Steam ReST Api

  Before making calls be sure to initialize the client with your Api key provided
  by Steam. Check `start_link/1` for more details.
  """

  @doc """
  Initializes the client with the api key from your `config.exs` file.

  Set the your token as `config :kronos, token: "Your-token"` OR
  export the `STEAM_TOKEN` variable: `export STEAM_TOKEN="your-token"`.

  ## Example

  ```elixir
  iex> Kronos.start_link()
  ```
  """
  def start_link do
    start_link(Application.get_env(:kronos, :token, System.get_env("STEAM_TOKEN")))
  end

  @doc """
  Initialize the client with an api key given directly.

  ## Example

  ```elixir
  iex> Kronos.start_link("your-token")
  ```
  """
  def start_link(key) do
    Agent.start_link(fn -> key end, name: __MODULE__)
  end

  @doc """
  Get the api key that you previously set.
  """
  def api_key do
    Agent.get(__MODULE__, &(&1))
  end
end
