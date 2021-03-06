defmodule GameInitializer do

  def initialize_game(map, config) do
    game_id = generate_game_id()

    get_mapdata(map, config)
    |> initialize_gamestate(map, config)
    |> add_game_id(game_id, config)
    |> save_gamestate(config)

    {:ok, game_id}
  end

  defp get_mapdata(map, config) do
    config[:masterdata].get_gamedata map
  end

  defp initialize_gamestate(mapdata, map, config) do
    {:ok, gamestate} = config[:gamestate].start_link map
    config[:gamestate].import_gamestate gamestate, mapdata
    gamestate
  end

  defp add_game_id(gamestate, game_id, config) do
    config[:gamestate].update_value gamestate, :game_id, game_id
    gamestate
  end

  defp save_gamestate(gamestate, config) do
    config[:gamestate].save_gamestate gamestate, config
  end

  defp generate_game_id() do
    {x, y, z} = :os.timestamp
    id = "game_id: " <> to_string(x) <> to_string(y) <> to_string(z) <> to_string(:rand.uniform)
    {:global, id}
  end

end
