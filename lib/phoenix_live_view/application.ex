defmodule Phoenix.LiveView.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    Supervisor.start_link(
      [
        Phoenix.LiveView.DynamicSupervisor,
        {Registry, keys: :unique, name: Phoenix.LiveView.Registry}
      ],
      strategy: :one_for_one,
      name: Phoenix.LiveView.Supervisor
    )
  end
end
