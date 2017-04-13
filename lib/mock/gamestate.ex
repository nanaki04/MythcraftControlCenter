defmodule Mock.Gamestate do
  def start_link(_name), do: Agent.start_link(fn -> 1+1 end)
  def start_link(_name, _options, link_options), do: Agent.start_link(fn -> 1+1 end, link_options)
  def import_gamestate(_gs, _mapdata, _opts), do: :ok
  def export_gamestate(_gs, _opts), do: :ok
  def update_value(_gs, _k, _v), do: :ok
end
