defmodule Mock.Gameplayer do
  def start_game(_game_id, _opts), do: Agent.start_link(fn -> 1+1 end)
end
