defmodule Mock.Gamelogic do

  def finish_turn(_, _, config), do: config[:gamestate]
  def add_player(_, _, _, config), do: config[:gamestate]
  def remove_player(_, _, config), do: config[:gamestate]
  def queue_task(_, _, _, _, config), do: config[:gamestate]

end
