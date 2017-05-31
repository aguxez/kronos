defmodule Valvex.HTTP do
  @moduledoc false

  def get_body(url) do
    url
    |> ExRated.check_rate(86400000, 100000) # 100_000 requests per day
    |> parse(url)
  end

  defp parse({:ok, _}, url) do
    %HTTPoison.Response{body: body, status_code: 200} = HTTPoison.get!(url)
    Poison.decode!(body)
  end
  defp parse({:error, reason}, _) do
    {:error, reason}
  end

  def key do
    Valvex.api_key()
  end
end
