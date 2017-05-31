defmodule Valvex do
  @moduledoc """
  Valvex is a simple wrapper for the Steam ReST Api

  Before making calls be sure to initialize the client with your Api key provided
  by Steam. Check `start_link/0` for more details.

  Every single one of the user ids specified here are 64-bit Steam ids.
  """

  alias Valvex.Api.{Player, App, GlobalAchievements, Game}

  @doc """
  Initializes the client with the api key from your `config.exs` file.

  Set your token as `config :valvex, token: "Your-token"` OR
  export the `STEAM_TOKEN` variable: `export STEAM_TOKEN="your-token"`.

  ## Example

  ```elixir
  iex> Valvex.start_link()
  ```
  """
  def start_link do
    start_link(Application.get_env(:valvex, :token, System.get_env("STEAM_TOKEN")))
  end

  @doc """
  Initialize the client with an api key given directly.

  ## Example

  ```elixir
  iex> Valvex.start_link("your-token")
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

  @doc """
  Return news of a game specified by its ID.

  ## Example

  ```elixir
  iex> Valvex.get_app_news(gameid: 730, count: 3, max_length: 100)
  ```
  """
  def get_app_news([gameid: id, count: count, max_length: m_length]) do
    App.get_app_news(gameid: id, count: count, max_length: m_length)
  end

  @doc """
  Returns Global achievements of a game in percentages.

  ## Example

  ```elixir
  iex> Valvex.global_achievements(730)
  ```
  """
  def global_achievements(id) do
    GlobalAchievements.percentages(id)
  end

  @doc """
  Return basic profile information for a given 64-bit Steam ID.

  Fetch for multiple ids by passing a list.

  ## Examples

  ```elixir
  iex> Valvex.player_summaries(123)

  iex> Valvex.player_summaries([123, 76561198083075294])
  ```
  """
  def player_summaries(ids) do
    Player.summaries(ids)
  end

  @doc """
  Returns the friend list of a given user specified by ID.

  User profile must be set to public.

  ## Example

  ```elixir
  iex> Valvex.friend_list(123)
  ```
  """
  def friend_list(id) do
    Player.friend_list(id)
  end

  @doc """
  Returns achievements of a player specified by user id and game id.

  ## Example

  ```elixir
  iex> Valvex.achievements(steam: 123, gameid: 730)
  ```
  """
  def achievements([steam: id, gameid: gameid]) do
    Player.achievements(steamid: id, gameid: gameid)
  end

  @doc """
  Returns stats from a player for a game specified by user id and game id.

  ## Example

  ```elixir
  iex> Valvex.user_stats(steamid: 123, gameid: 730)
  ```
  """
  def user_stats([steamid: id, gameid: gameid]) do
    Player.stats_for_game(steamid: id, gameid: gameid)
  end

  @doc """
  Returns owned games for a user specified by user id.

  ## Example

  ```elixir
  iex> Valvex.owned_games(123)
  ```
  """
  def owned_games(id) do
    Player.owned_games(id)
  end

  @doc """
  Returns recently played games from an user specified by user id.

  Pass `count` as a parameter for a maximun of games to return. Usually it's not much
  by default.

  ## Examples

  ```elixir
  iex> Valvex.recently_played(steamid: 123)

  iex > Valvex.recently_played(steamid: 123, count: 3)
  ```
  """
  def recently_played([steamid: id, count: count]) do
    Player.recently_played(steamid: id, count: count)
  end
  def recently_played(steamid: id) do
    Player.recently_played(steamid: id)
  end

  @doc """
  Returns the original user id of game's owner if the game that the user
  is currently played is a shared one.

  Pass the id of the user to fetch and the id of the game.

  ## Example

  ```elixir
  iex> Valvex.shared(steamid: 123, gameid: 730)
  ```
  """
  def shared([steamid: id, gameid: gameid]) do
    Player.shared_game(steamid: id, gameid: gameid)
  end

  @doc """
  Returns bans for a given player or list of players specified by user id.

  ## Examples

  ```elixir
  iex> Valvex.bans(123)

  iex> Valvex.bans([123, 456, 789])
  ```
  """
  def bans(ids) do
    Player.bans(ids)
  end

  @doc """
  Returns inventory of an specific player.

  Options are:

  1. `count`: Number of items to retrieve from the inventory, maximum is 5000.
  2. `lang`: Language of the description returned.

  ## Examples

  ```elixir
  iex> Valvex.inventory(user_id, game_id)

  iex> Valvex.inventory(user_id, game_id, count: 500)
  ```
  """
  def inventory(id, gameid, opts \\ []) do
    Player.inventory(id, gameid, opts)
  end

  @doc """
  Returns schema for a given game specified by game id.

  ## Example

  ```elixir
  iex> Valvex.game_schema(730)
  ```
  """
  def game_schema(gameid) do
    Game.schema(gameid)
  end
end
