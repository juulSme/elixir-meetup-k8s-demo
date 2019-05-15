defmodule Demo.Monitoring do
  @moduledoc """
  Configuration for Prometheus / Grafana monitoring of this application and
  the BEAM on which it runs. Uses :prometheus_ex, :prometheus_phoenix,
  :prometheus_plugs and :prometheus_process_collector.

  To bootstrap all of it, do the following:
   - the `setup/0` method should be called from `Application.start/2`
   - in the endpoint configuration, add `instrumenters: instrumenters: [DemoWeb.Endpoint.PhoenixInstrumenter, DemoWeb.PlugPipelineInstrumenter]`
   - in the endpoint itself, add `plug Demo.PlugExporter` and `plug DemoWeb.PlugPipelineInstrumenter`, preferably before `Plug.Logger`
  """

  @doc """
  Setup metrics instrumenters and exporters
  """
  def setup() do
    Demo.PlugExporter.setup()
    DemoWeb.Endpoint.PhoenixInstrumenter.setup()
    DemoWeb.PlugPipelineInstrumenter.setup()
    require Prometheus.Registry
    Prometheus.Registry.register_collector(:prometheus_process_collector)
  end
end

defmodule Demo.PlugExporter do
  @moduledoc false

  use Prometheus.PlugExporter
end

defmodule DemoWeb.Endpoint.PhoenixInstrumenter do
  @moduledoc false

  use Prometheus.PhoenixInstrumenter
end

defmodule DemoWeb.PlugPipelineInstrumenter do
  @moduledoc false

  use Prometheus.PlugPipelineInstrumenter
end
