defmodule Kronos.Api.GlobalAchievements do
  @moduledoc false

  alias Kronos.HTTP

  @v "v0002"

  def percentages(gameid) do
    url = "http://api.steampowered.com/ISteamUserStats/GetGlobalAchievementPercentagesForApp/#{@v}/?gameid=#{gameid}"
    HTTP.get_body(url)
  end
end
