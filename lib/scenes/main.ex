defmodule SampleScenicInky.Scene.Main do
  use Scenic.Scene
  alias Scenic.Graph

  import Scenic.Primitives
  require Logger

  @graph Graph.build(font_size: 32, font: :roboto_mono, theme: :light)
         |> rectangle({212, 104}, fill: :white)
         |> text("Inky", fill: :black, t: {8, 26})
         |> text("Scenic", fill: :red, t: {8, 60})
         |> text("Nerves", fill: :black, t: {8, 94})

  def init(_, _) do
    state = %{
      graph: @graph,
      count: 0
    }

    Process.send_after(self(), :update, 30000)
    {:ok, state, push: @graph}
  end

  def handle_info(:update, state) do
    graph =
      Graph.build(font_size: 32 + state.count, font: :roboto_mono, theme: :light)
      |> rectangle({212, 104}, fill: :white)
      |> text("Inky", fill: :black, t: {8, 26})
      |> text("Scenic", fill: :red, t: {8, 60})
      |> text("Nerves", fill: :black, t: {8, 94})

    Process.send_after(self(), :update, 30000)
    count = state.count + 1
    {:noreply, %{state | count: count, graph: graph}, push: graph}
  end
end
