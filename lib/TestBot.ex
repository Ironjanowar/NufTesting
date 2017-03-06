defmodule EchoBot do
  @bot :echo_bot
  def bot(), do: @bot

  use Telex.Bot, name: @bot
  use Telex.Dsl

  #require Logger

  def handle({:command, "echo", %{text: t} = msg}, name) do
    answer msg, t, bot: name
  end

  def handle({:command, "start", %{from: %{username: user}} = msg}, name) do
    answer msg, "Hi! @#{user}", bot: name
  end

  # Listener
  def handle({_, _, %{text: t, from: %{username: user}}}, _) when not is_nil(user) do
    [:hotpink, "[LISTENER] @#{user} -> #{t}"]
    |> Bunt.puts
  end

  def handle({_, _, %{text: t, from: %{first_name: user}}}, _) do
    [:hotpink, "[LISTENER] @#{user} -> #{t}"]
    |> Bunt.puts
  end
end
