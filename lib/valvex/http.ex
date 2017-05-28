defmodule Valvex.HTTP do
  @moduledoc false

  def get_body(url) do
    ExRated.check_rate(url, 86400000, 100000) # 100_000 requests per day
    %HTTPoison.Response{body: body, status_code: 200} = HTTPoison.get!(url)
    Poison.decode!(body)
  end

  def key do
    Valvex.api_key()
  end
end
