defmodule Demo.AttentionSeekingChild do
  @moduledoc """
  Server that needs a lot of attention, so it is recommended to run it as a singleton
  to protect one's sanity.
  """
  use GenServer
  require Logger

  @wake_interval_ms 10 * 1000

  ####################
  # Server callbacks #
  ####################

  @doc false
  @impl GenServer
  def init(name: name) do
    Logger.info("#{name} initiated on node #{Node.self() |> Atom.to_string()}")

    sleep()

    {:ok, %{name: name}}
  end

  @doc false
  @impl GenServer
  def handle_info(:wake, %{name: name}) do
    Logger.info("#{name} is in need of attention on node #{Node.self() |> Atom.to_string()}")

    sleep()

    {:noreply, %{name: name}, :hibernate}
  end

  ############
  # Privates #
  ############

  defp sleep do
    Process.send_after(self(), :wake, @wake_interval_ms)
  end
end
