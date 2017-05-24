defmodule ValvexTest do
  use ExUnit.Case

  alias Valvex.Api.{Player, App, GlobalAchievements, Game}

  @steamids ["76561198083075293", "76561198075672583"]
  @steamid ["76561198083075293"]

  test "return appnews body on request" do
    req = App.get_app_news(gameid: 440, count: 1, max_length: 100)

    assert Map.has_key?(req, "appnews") == true
  end

  test "return global achievements body on request" do
    req = GlobalAchievements.percentages(440) # Steam game id

    assert Map.has_key?(req, "achievementpercentages") == true
  end

  test "return player summaries body" do
    req = Player.summaries(@steamids)

    assert Map.has_key?(req, "response") == true
  end

  test "return player friend list" do
    list = Player.friend_list(@steamid)

    assert Map.has_key?(list, "friendslist") == true
  end

  test "return player achievements for a game" do
    ach = Player.achievements(steamid: @steamid, gameid: 730) # CS:GO id

    assert Map.has_key?(ach, "playerstats") == true
  end

  test "return stats for player in specific game" do
    stats = Player.stats_for_game(steamid: @steamid, gameid: 730)

    assert Map.has_key?(stats, "playerstats") == true
  end

  test "return owned games of user" do
    games = Player.owned_games(@steamid)

    assert Map.has_key?(games, "response") == true
  end

  test "return user's recently played games passing count" do
    games = Player.recently_played(steamid: @steamid, count: 3)

    assert Map.has_key?(games, "response") == true
  end

  test "return user's recently played games without count" do
    games = Player.recently_played(steamid: @steamid)

    assert Map.has_key?(games, "response") == true
  end

  test "check steamid of game owner if user is playing a shared game" do
    request = Player.shared_game(steamid: @steamid, gameid: 240) # A different game this time

    assert Map.has_key?(request, "response") == true
  end

  test "returns Community, VAC and economy ban statuses for players" do
    bans = Player.bans(@steamids)

    assert Map.has_key?(bans, "players") == true
  end

  test "return schema for a given game" do
    game = Game.schema(730) # CS:GO id

    assert Map.has_key?(game, "game") == true
  end
end
