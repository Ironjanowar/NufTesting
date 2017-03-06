defmodule TestBot do
  use Application
  def start, do: start(1, 1)

  def start(_, _) do
    import Supervisor.Spec

    children = [
      supervisor(Telex, []),
      worker(EchoBot, [:updates, Config.get(:telex, :token)])
    ]

    opts = [strategy: :one_for_one, name: TestBot]
    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        IO.puts "Starting"
        ok
      error ->
        IO.puts "Error"
        error
    end
  end
end
