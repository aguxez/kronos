defmodule Valvex.Api.GlobalAchievements do
  @moduledoc false

  alias Valvex.HTTP

  @v "v0002"

  def percentages(gameid) do
    HTTP.get_body("http://api.steampowered.com/ISteamUserStats/GetGlobalAchievementPercentagesForApp/#{@v}/?gameid=#{gameid}")
  end
end
