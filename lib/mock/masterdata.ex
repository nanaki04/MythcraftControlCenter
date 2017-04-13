defmodule Mock.Masterdata do
  def get_gamedata(map), do: [name: map, isles: [brimstone: {1, 1}]]
  def get_default_gamesettings, do: []
end
