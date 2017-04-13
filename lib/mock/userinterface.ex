defmodule Mock.Userinterface do

  def render_gamestate(_gamestate), do: :ok
  def request_user_action(), do: [play_turn: {}]

end
