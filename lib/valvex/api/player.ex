defmodule Valvex.Api.Player do
  @moduledoc false

  alias Valvex.HTTP

  @v1 "v0001"
  @v2 "v0002"
  # @v3 "v1" / This should be v2 instead but I wanted everything Player related
  # in the same module, change if possible, sometime, only 1 endpoint
  # uses this in this module.

  # TODO: Check if "v1"(@v3) actually matters in the bans endpoint.
  # Wait for an error to change this?

  # Get summary of single or multiple players separated by comma.
  def summaries(steamids) when is_list(steamids) do
    ids = Enum.join(steamids, ",")
    HTTP.get_body("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/#{@v2}/?key=#{HTTP.key()}&steamids=#{ids}")
  end
  def summaries(steamid) do
    HTTP.get_body("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/#{@v2}/?key=#{HTTP.key()}&steamids=#{steamid}")
  end

  def friend_list(steamid) do
    HTTP.get_body("http://api.steampowered.com/ISteamUser/GetFriendList/#{@v1}/?key=#{HTTP.key()}&steamid=#{steamid}&relationship=friend")
  end

  # Get player achievements for a specific game.
  def achievements([steamid: id, gameid: gameid]) do
    HTTP.get_body("http://api.steampowered.com/ISteamUserStats/GetPlayerAchievements/#{@v1}/?appid=#{gameid}&key=#{HTTP.key()}&steamid=#{id}")
  end

  # Get player stats for given game.
  def stats_for_game([steamid: id, gameid: gameid]) do
    HTTP.get_body("http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/#{@v2}/?appid=#{gameid}&key=#{HTTP.key()}&steamid=#{id}")
  end

  def owned_games(steamid) do
    HTTP.get_body("http://api.steampowered.com/IPlayerService/GetOwnedGames/#{@v1}/?key=#{HTTP.key()}&steamid=#{steamid}&include_appinfo=1")
  end

  def recently_played(steamid: steamid) do
    HTTP.get_body("http://api.steampowered.com/IPlayerService/GetRecentlyPlayedGames/#{@v1}/?key=#{HTTP.key()}&steamid=#{steamid}")
  end
  def recently_played([steamid: steamid, count: count]) do
    HTTP.get_body("http://api.steampowered.com/IPlayerService/GetRecentlyPlayedGames/#{@v1}/?key=#{HTTP.key()}&steamid=#{steamid}&count=#{count}")
  end

  # Checks if user is playing a shared game, if so, shows the id of game's owner.
  def shared_game([steamid: id, gameid: gameid]) do
    HTTP.get_body("http://api.steampowered.com/IPlayerService/IsPlayingSharedGame/#{@v1}/?key=#{HTTP.key()}&steamid=#{id}&appid_playing=#{gameid}")
  end

  # Checks multiple bans for given player or list of players by id.
  def bans(steamids) when is_list(steamids) do
    ids = Enum.join(steamids, ",")
    HTTP.get_body("http://api.steampowered.com/ISteamUser/GetPlayerBans/#{@v1}/?key=#{HTTP.key()}&steamids=#{ids}")
  end
  def bans(id) do
    HTTP.get_body("http://api.steampowered.com/ISteamUser/GetPlayerBans/#{@v1}/?key=#{HTTP.key()}&steamids=#{id}")
  end
end
