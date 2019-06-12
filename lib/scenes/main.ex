defmodule SampleScenicInky.Scene.Main do
  use Scenic.Scene
  alias Scenic.Graph

  import Scenic.Primitives
  require Logger

  @graph Graph.build(font_size: 22, font: :roboto_mono, theme: :light)
         |> rectangle({212, 4}, fill: :black)
         |> rectangle({212, 4}, fill: :red)
         |> text("ViewPort")

  def init(_, _) do
    state = %{
      graph: @graph,
      count: 0
    }

    Process.send_after(self(), :update, 50000)
    {:ok, state, push: @graph}
  end

  def handle_info(:update, state) do
    graph =
      Graph.build(font_size: 22, font: :roboto_mono, theme: :light)
      |> rectangle({212, 4}, fill: :black)
      |> rectangle({4, 104}, fill: :red)
      |> text(to_string(state.count))

    Process.send_after(self(), :update, 50000)
    count = state.count + 1
    Logger.info(to_string(count))
    {:noreply, %{state | count: count, graph: graph}, push: graph}
  end
end
