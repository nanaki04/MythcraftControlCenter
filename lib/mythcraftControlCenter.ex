defmodule MythcraftControlCenter do
  use GenServer

  def start_link(config) do
    GenServer.start_link(__MODULE__, config, name: __MODULE__)
  end

  def init(config) do
    {:ok, config}
  end

  def handle_call({:start_map, {map}}, _from, config) do
    {:ok, game_id} = GameInitializer.initialize_game map, config 
    config[:gameplayer].start_game game_id, config
    {:reply, config[:gamestate], config}
  end

  def handle_cast({:add_player, {game_id, player_id}}, config) do
    config[:gamelogic].add_player(game_id, player_id, config)
    {:noreply, config}
  end

  def handle_cast({:remove_player, {game_id, player_id}}, config) do
    config[:gamelogic].remove_player(game_id, player_id, config)
    {:noreply, config}
  end

  def handle_cast({:finish_turn, {game_id, player_id}}, config) do
    config[:gamelogic].finish_turn(game_id, player_id, config)
    {:noreply, config}
  end

  def handle_cast({:queue_task, {game_id, player_id, task, arguments}}, config) do
    config[:gamelogic].queue_task(game_id, player_id, task, arguments, config)
    {:noreply, config}
  end

end
