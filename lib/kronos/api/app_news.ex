defmodule Kronos.Api.App do
  @moduledoc false

  alias Kronos.HTTP
  alias __MODULE__, as: App

  @v "v0002"

  @enforce_keys [:gameid, :count, :max_length]
  defstruct [:gameid, :count, :max_length]

  def get_app_news([gameid: id, count: count, max_length: m_length]) do
    request(%App{gameid: id, count: count, max_length: m_length})
  end

  def request(%App{gameid: id, count: count, max_length: m_length}) do
    HTTP.get_body("http://api.steampowered.com/ISteamNews/GetNewsForApp/#{@v}/?appid=#{id}&count=#{count}&maxlength=#{m_length}")
  end
end
