use Mix.Config

config :sample_scenic_inky, :viewport, %{
  name: :main_viewport,
  default_scene: {SampleScenicInky.Scene.Main, nil},
  size: {212, 104},
  opts: [scale: 1.0],
  drivers: [
    %{
      module: Scenic.Driver.Glfw
    }
  ]
}
