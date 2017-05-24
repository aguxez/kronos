defmodule Kronos.HTTP do
  @moduledoc false

  def get_body(url) do
    %HTTPoison.Response{body: body, status_code: 200} = HTTPoison.get!(url)
    Poison.decode!(body)
  end

  def key do
    Kronos.api_key()
  end
end
