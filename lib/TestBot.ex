defmodule EchoBot do
  @bot :echo_bot
  def bot(), do: @bot

  use Telex.Bot, name: @bot
  use Telex.Dsl

  require Logger

  def handle({:command, "echo", %{text: t} = msg}, name) do
    answer msg, t, bot: name
  end
end
